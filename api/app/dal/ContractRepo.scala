package dal

import java.sql.Timestamp
import javax.inject.{Inject, Singleton}

import play.api.db.slick.DatabaseConfigProvider
import slick.jdbc.JdbcProfile
import models.Contract

import scala.concurrent.{ExecutionContext, Future}

/**
  * A repository for people.
  *
  * @param dbConfigProvider The Play db config provider. Play will inject this for you.
  */
@Singleton
class ContractRepo @Inject()(dbConfigProvider: DatabaseConfigProvider)(implicit ec: ExecutionContext) {
  // We want the JdbcProfile for this provider
  private val dbConfig = dbConfigProvider.get[JdbcProfile]

  // These imports are important, the first one brings db into scope, which will let you do the actual db operations.
  // The second one brings the Slick DSL into scope, which lets you define the table and other queries.
  import dbConfig._
  import profile.api._

  /**
    * Here we define the table. It will have a name of hit
    */
  private class ContractTable(tag: Tag)
    extends Table[Contract](tag, "contracts") {

    /** The ID column, which is the primary key, and auto incremented */
    def id = column[Option[Long]]("id", O.PrimaryKey, O.AutoInc)

    def organizationId = column[Long]("organization_id")

    def category = column[String]("category")

    def description = column[String]("description")

    def createdAt = column[Option[Timestamp]]("created_at")

    /**
      * This is the tables default "projection".
      *
      * It defines how the columns are converted to and from the Person object.
      *
      */
    def * =
      (organizationId, category, description, createdAt, id)
        .<>((Contract.apply _).tupled, Contract.unapply)
  }

  /**
    * The starting point for all queries on the Comments table.
    */
  private val table = TableQuery[ContractTable]

  def create(contract: Contract): Future[Int] = db.run {
    table += contract
  }

  /**
    * List all in the database.
    */
  def list(): Future[Seq[Contract]] = db.run {
    table.result
  }
}
