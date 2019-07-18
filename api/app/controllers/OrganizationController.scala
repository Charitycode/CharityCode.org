package controllers

import models._
import dal._
import javax.inject._
import play.api.libs.json.Json
import play.api.mvc._

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
class OrganizationController @Inject()(cc: ControllerComponents,
                                       organizationRepo: OrganizationRepo)
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
      organizationRepo.list().map { organizations =>
        Ok(Json.toJson(organizations))
      }
  }

  def getOrganization(id: Long): Action[AnyContent] = Action.async {
    implicit request: Request[AnyContent] =>
      organizationRepo.get(id).map { organizationOpt: Option[Organization] =>
        organizationOpt match {
          case Some(organization) =>
            Ok(Json.toJson(organization))
          case None =>
            NotFound
        }
      }
  }

  def createOrganization(): Action[AnyContent] = Action.async {
    implicit request: Request[AnyContent] =>
      case class OrganizationBody(ein: String,
                                  name: String,
                                  taxId: String,
                                  classification: String,
                                  focus: String,
                                  email: String,
                                  password: String)
      val form = Form[OrganizationBody] {
        mapping(
          "ein" -> nonEmptyText,
          "name" -> nonEmptyText,
          "taxId" -> nonEmptyText,
          "classification" -> nonEmptyText,
          "focus" -> nonEmptyText,
          "email" -> email,
          "password" -> nonEmptyText
        )(OrganizationBody.apply)(OrganizationBody.unapply)
      }

      def failure(input: Form[OrganizationBody]) = Future { BadRequest }
      def success(input: OrganizationBody) = {
        organizationRepo
          .create(
            new Organization(
              ein = input.ein,
              name = input.name,
              taxId = input.taxId,
              classification = input.classification,
              focus = input.focus,
              email = input.email,
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
