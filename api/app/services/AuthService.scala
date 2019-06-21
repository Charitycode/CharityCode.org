package services

import pdi.jwt.{JwtAlgorithm, JwtJson}
import play.api.libs.json.{JsObject}
import scala.util.Try
import com.roundeights.hasher.Implicits._
import scala.language.postfixOps


object AuthService {

  val key = "9!h:L<o81R,oB(tX2uY0L_joNeK'Rr"
  val algo = JwtAlgorithm.HS256

  def encodeJWT(json: String): String = JwtJson.encode(json, key, algo)

  def encodeJWT(json: JsObject): String = JwtJson.encode(json, key, algo)

  def decodeJWT(blob: String): Try[JsObject] = JwtJson.decodeJson(blob, key, Seq(algo))

  def encodePassword(password: String): String = {
    password.bcrypt
  }

  def isSameAsEncrypted(password: String, encryptedTarget: String): Boolean = {
    val pEncrypt = password.bcrypt
    pEncrypt.hash= encryptedTarget
  }
}
