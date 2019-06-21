package models

import java.sql.Timestamp
import java.text.SimpleDateFormat
import java.time.LocalDateTime

import play.api.libs.json._

object User {
  implicit object timestampFormat extends Format[Timestamp] {
    val format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SS'Z'")
    def reads(json: JsValue) = {
      val str = json.as[String]
      JsSuccess(new Timestamp(format.parse(str).getTime))
    }
    def writes(created_at: Timestamp) = JsString(format.format(created_at))
  }
  implicit val userFormat = Json.format[User]

  implicit val time = Timestamp.valueOf(LocalDateTime.now)
}

case class User(
  first: String,
  last: String,
  email: String,
  classification: String,
  phone: Option[String],
//  web_url: String,
//  git_url: String,
  password: String,
  created_at: Option[Timestamp] = Option(Timestamp.valueOf(LocalDateTime.now)),
  id: Option[Long] = None
)
