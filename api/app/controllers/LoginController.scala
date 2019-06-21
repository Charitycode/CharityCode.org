package controllers

import javax.inject._
import play.api.mvc._
import dal.{UserRepo}
import play.api.data.Form
import play.api.data.Forms._
import play.api.libs.json.Json
import services.AuthService

import scala.concurrent.ExecutionContext.Implicits.global
import scala.concurrent.Future

/**
  * This controller creates an `Action` to handle HTTP requests to the
  * application's home page.
  */
@Singleton
class LoginController @Inject()(cc: ControllerComponents, userRepo: UserRepo)
    extends AbstractController(cc) {

  /**
    * Create an Action to render an HTML page.
    *
    * The configuration in the `routes` file means that this method
    * will be called when the application receives a `GET` request with
    * a path of `/`.
    */
  def login(): Action[AnyContent] = Action.async {
    implicit request: Request[AnyContent] =>
      {

        case class LoginBody(email: String, password: String)

        val loginForm = Form[LoginBody] {
          mapping("email" -> nonEmptyText, "password" -> nonEmptyText)(
            LoginBody.apply
          )(LoginBody.unapply)
        }

        def failure(badForm: Form[LoginBody]) = Future {
          BadRequest("invalid username/password combination")
        }
        def success(input: LoginBody) = {
          this.userRepo.findByEmail(input.email).map {
            case _ @Some(user) => {
              if (AuthService
                    .isSameAsEncrypted(input.password, user.password)) {
                this.userRepo.updateLastLogin(user)
                val token = Json.obj(
                  ("user", user.id),
                  ("email", user.email),
                  (
                    "checksum",
                    AuthService.encodePassword(s"${user.email}${user.id.get}")
                  )
                )
                Ok(AuthService.encodeJWT(token))
              } else {
                Unauthorized
              }
            }
            case None =>
              Unauthorized
          }
        }

        loginForm.bindFromRequest.fold(failure, success)
      }
  }
}
