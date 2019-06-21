package requests

import models.User
import play.api.mvc.{Request, WrappedRequest}

class AuthRequest[A](val user: Option[User], val request: Request[A])
    extends WrappedRequest[A](request)
