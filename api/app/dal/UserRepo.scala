package dal

import java.sql.Timestamp
import javax.inject.{Inject, Singleton}

import play.api.db.slick.DatabaseConfigProvider
import slick.jdbc.JdbcProfile
import models.Organization

import scala.concurrent.{ExecutionContext, Future}

/**
  * A repository for people.
  *
  * @param dbConfigProvider The Play db config provider. Play will inject this for you.
  */
@Singleton
class UserRepo @Inject()(dbConfigProvider: DatabaseConfigProvider)(implicit ec: ExecutionContext) {
  // We want the JdbcProfile for this provider
  private val dbConfig = dbConfigProvider.get[JdbcProfile]

  // These imports are important, the first one brings db into scope, which will let you do the actual db operations.
  // The second one brings the Slick DSL into scope, which lets you define the table and other queries.
  import dbConfig._
  import profile.api._

  /**
    * Here we define the table. It will have a name of hit
    */
  private class UserTable(tag: Tag)
    extends Table[User](tag, "users") {

    /** The ID column, which is the primary key, and auto incremented */
    def id = column[Option[Long]]("id", O.PrimaryKey, O.AutoInc)

    def first = column[String]("first")

    def last = column[String]("last")

    def email = column[String]("email")

    def classification = column[String]("classification")

    def phone = column[String]("phone")

    def password = column[String]("password")

    def createdAt = column[Option[Timestamp]]("created_at")

    /**
      * This is the tables default "projection".
      *
      * It defines how the columns are converted to and from the Person object.
      *
      */
    def * =
      (first, last, email, classification, phone, password, createdAt, id)
        .<>((User.apply _).tupled, User.unapply)
  }

  /**
    * The starting point for all queries on the Comments table.
    */
  private val table = TableQuery[UserTable]

  def create(user: User): Future[Int] = db.run {
    table += user
  }

  def get(id: Long): Future[Option[User]] = db.run {
    table.filter(_.id === id).result
  }.map(_.headOption)

  /**
    * List all in the database.
    */
  def list(): Future[Seq[User]] = db.run {
    table.result
  }
}
