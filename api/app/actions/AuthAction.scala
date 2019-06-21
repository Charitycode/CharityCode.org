package actions

import com.google.inject.Inject
import dal.UserRepo
import play.api.mvc.{
  ActionBuilder,
  ActionTransformer,
  AnyContent,
  BodyParsers,
  Request
}
import requests.AuthRequest
import services.AuthService

import scala.concurrent.{ExecutionContext, Future}
import scala.util.{Failure, Success}

class AuthAction @Inject()(val parser: BodyParsers.Default, userRepo: UserRepo)(
  implicit val executionContext: ExecutionContext
) extends ActionBuilder[AuthRequest, AnyContent]
    with ActionTransformer[Request, AuthRequest] {

  override protected def transform[A](
    request: Request[A]
  ): Future[AuthRequest[A]] = {
    val auth = request.headers.get("authorization")
    auth match {
      case Some(a) =>
        AuthService.decodeJWT(a) match {
          case Success(user) =>
            val userId = user \\ "user"
            val email = user \\ "email"
            val checksum = user \\ "checksum"
            if (userId.nonEmpty
                && email.nonEmpty
                && checksum.nonEmpty
                && AuthService.isSameAsEncrypted(
                  s"${email.head.as[String]}${userId.head.as[Long]}",
                  checksum.head.as[String]
                ))
              userRepo.get(userId.head.as[Long]).map { user =>
                new AuthRequest[A](user, request)
              } else
              Future.successful(new AuthRequest[A](None, request))

          case Failure(_) =>
            Future.successful(new AuthRequest[A](None, request))
        }
      case None => Future.successful(new AuthRequest[A](None, request))
    }
  }
}
