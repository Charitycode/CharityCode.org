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
class OrganizationRepo @Inject()(dbConfigProvider: DatabaseConfigProvider)(implicit ec: ExecutionContext) {
  // We want the JdbcProfile for this provider
  private val dbConfig = dbConfigProvider.get[JdbcProfile]

  // These imports are important, the first one brings db into scope, which will let you do the actual db operations.
  // The second one brings the Slick DSL into scope, which lets you define the table and other queries.
  import dbConfig._
  import profile.api._

  /**
    * Here we define the table. It will have a name of hit
    */
  private class OrganizationTable(tag: Tag)
    extends Table[Organization](tag, "organizations") {

    /** The ID column, which is the primary key, and auto incremented */
    def id = column[Option[Long]]("id", O.PrimaryKey, O.AutoInc)

    def ein = column[String]("ein")

    def name = column[String]("name")

    def taxId = column[String]("tax_id")

    def classification = column[String]("classification")

    def focus = column[String]("focus")

    def email = column[String]("email")

    def password = column[String]("password")

    def createdAt = column[Option[Timestamp]]("created_at")

    /**
      * This is the tables default "projection".
      *
      * It defines how the columns are converted to and from the Person object.
      *
      */
    def * =
      (ein, name, taxId, classification, focus, email, password, createdAt, id)
        .<>((Organization.apply _).tupled, Organization.unapply)
  }

  /**
    * The starting point for all queries on the Comments table.
    */
  private val table = TableQuery[OrganizationTable]

  def create(organization: Organization): Future[Int] = db.run {
    table += organization
  }

  /**
    * List all in the database.
    */
  def list(): Future[Seq[Organization]] = db.run {
    table.result
  }
}
