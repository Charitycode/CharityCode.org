module Main exposing (Model, Msg(..), init, update, view)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url
import Router exposing (Route(..), routeParser, fromUrl)
import NavBar as NavBar
import Page.Login as Login
import Page.Home as Home
import Page.Why as Why
import Page.Signup as Signup
import Footer as Footer
 
-- MAIN
main : Program () Model Msg
main =
  Browser.application
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    , onUrlChange = UrlChanged
    , onUrlRequest = LinkClicked
    }



-- MODEL
type alias Model =
  { key : Nav.Key
  , url : Url.Url
  , currentView: Route
  }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
  ( Model key url Home, Cmd.none )


-- UPDATE
type Msg
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    LinkClicked urlRequest ->
      case urlRequest of
        Browser.Internal url ->
          ( model, Nav.pushUrl model.key (Url.toString url) )

        Browser.External href ->
          ( model, Nav.load href )

    UrlChanged url ->
      ( { model | url = url, currentView = fromUrl url }
      , Cmd.none
      )



-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ =
  Sub.none



-- VIEW
view : Model -> Browser.Document Msg
view model =
  { title = "Charity Code - Helping Nonprofits find the development help they need!"
  , body =
      [ NavBar.view {}
      , viewBody model
      , Footer.view
      ]
  }

viewBody: Model -> Html msg
viewBody model =
  case model.currentView of
    Login ->
      (Login.view {email = "", password = ""}).content
    Home ->
      (Home.view).content
    Why ->
      (Why.view).content
    SignUp ->
      (Signup.view).content
    _ -> div [class "section"] [text "Nothing to see here!"]