package controllers

import dal._
import javax.inject._
import play.api.libs.json.Json
import play.api.mvc._

import scala.concurrent.ExecutionContext.Implicits.global

/**
  * This controller creates an `Action` to handle HTTP requests to the
  * application's home page.
  */
@Singleton
class ContractController @Inject()(cc: ControllerComponents,
                                   contractRepo: ContractRepo)
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
      contractRepo.list().map { contracts =>
        Ok(Json.toJson(contracts))
      }
  }
}
