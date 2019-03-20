module Main exposing (Model, Msg(..), init, update, view)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (..)
import Url
import Url.Parser as Parser exposing (Parser, (</>), int, map, oneOf, s, string)
import NavBar as NavBar
import Page.Login as Login
 
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
type Route
  = Home
  | Login
  | SignUp
  | Contracts
  | Contract Int
  | Profile String
  | NotFound

routeParser : Parser (Route -> a) a
routeParser = 
  oneOf
    [ map Home (s "home")
    , map Login (s "login")
    , map SignUp (s "signup")
    , map Contracts (s "contracts")
    , map Contract (s "contract" </> int)
    , map Profile (s "profile" </> string)
    ]

fromUrl : Url.Url -> Route
fromUrl url =
  Maybe.withDefault NotFound (Parser.parse routeParser url)

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
      , text "The current URL is: "
      , b [] [ text (Url.toString model.url) ]
      ]
  }

viewBody: Model -> Html msg
viewBody model =
  case model.currentView of
    Login ->
      (Login.view {email = "", password = ""}).content
    _ -> div [] [text "Nothing to see here!"]

viewLink : String -> Html msg
viewLink path =
  li [] [ a [ href path ] [ text path ] ]