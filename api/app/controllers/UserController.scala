package controllers

import models._
import dal._
import javax.inject._
import play.api.mvc.{
  AbstractController,
  Action,
  AnyContent,
  ControllerComponents,
  Request
}
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
class UserController @Inject()(cc: ControllerComponents, userRepo: UserRepo)
    extends AbstractController(cc) {

  /**
    * Create an Action to render an HTML page.
    *
    * The configuration in the `routes` file means that this method
    * will be called when the application receives a `GET` request with
    * a path of `/`.
    */
  def index(): Action[AnyContent] = Action.async {
    implicit request: Request[AnyContent] =>
      userRepo.list().map { users =>
        Ok(Json.toJson(users))
      }
  }

  def getUser(id: Long): Action[AnyContent] = Action.async {
    implicit request: Request[AnyContent] =>
      userRepo.get(id).map { userOpt: Option[User] =>
        userOpt match {
          case Some(user) =>
            Ok(Json.toJson(user))
          case None =>
            NotFound
        }

      }
  }

  def createUser(): Action[AnyContent] = Action.async {
    implicit request: Request[AnyContent] =>
      case class UserBody(first: String,
                          last: String,
                          email: String,
                          classification: String,
                          phone: Option[String],
                          password: String)
      val form = Form[UserBody] {
        mapping(
          "first" -> nonEmptyText,
          "last" -> nonEmptyText,
          "email" -> email,
          "classification" -> nonEmptyText,
          "phone" -> optional(nonEmptyText),
          "password" -> nonEmptyText
        )(UserBody.apply)(UserBody.unapply)
      }

      def failure(input: Form[UserBody]) = Future { BadRequest }
      def success(input: UserBody) = {
        userRepo
          .create(
            new User(
              first = input.first,
              last = input.last,
              email = input.email,
              classification = input.classification,
              phone = input.phone,
              password = AuthService.encodePassword(input.password),
              created_at = None,
              id = None
            )
          )
          .map(id => Ok(Json.toJson(Map("id" -> id))))
      }

      form.bindFromRequest.fold(failure, success)
  }
}
