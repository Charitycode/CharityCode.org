name := """api"""
organization := "org.charitycode"

version := "1.0-SNAPSHOT"

lazy val root = (project in file(".")).enablePlugins(PlayScala)

scalaVersion := "2.12.8"
resolvers ++= Seq("jBCrypt Repository" at "http://repo1.maven.org/maven2/org/")

libraryDependencies ++= Seq(
  guice,
  "org.scalatestplus.play" %% "scalatestplus-play" % "4.0.2" % Test,
  "com.google.code.findbugs" % "jsr305" % "2.0.2",
  // "com.google.guava" % "guava" % "15.0",
  "com.google.code.gson" % "gson" % "2.8.5",
  "com.typesafe.play" %% "play-slick" % "3.0.0-M5",
  "com.typesafe.play" %% "play-slick-evolutions" % "3.0.0-M5",
  "org.postgresql" % "postgresql" % "42.2.5",
  "com.pauldijou" %% "jwt-play-json" % "2.1.0",
  "com.github.nscala-time" %% "nscala-time" % "2.20.0",
  "com.github.seratch" %% "awscala" % "0.8.+",
  "io.sentry" % "sentry-logback" % "1.7.16",
  "com.sksamuel.scrimage" %% "scrimage-core" % "2.1.8",
  "com.sksamuel.scrimage" %% "scrimage-io-extra" % "2.1.8",
  "com.sksamuel.scrimage" %% "scrimage-core" % "2.1.8",
  "com.roundeights" %% "hasher" % "1.2.0",
  "org.matthicks" %% "mailgun4s" % "1.0.9",
  "org.scala-lang.modules" %% "scala-xml" % "1.1.1",
  "org.webjars" % "swagger-ui" % "2.2.0",
  "org.mindrot" % "jbcrypt" % "0.3m",
  "org.mockito" % "mockito-core" % "2.27.0" % Test
)
// Adds additional packages into Twirl
//TwirlKeys.templateImports += "org.charitycode.controllers._"

// Adds additional packages into conf/routes
// play.sbt.routes.RoutesKeys.routesImport += "org.charitycode.binders._"
