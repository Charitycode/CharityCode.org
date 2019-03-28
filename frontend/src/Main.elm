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
import Page.Contracts as Contracts
import Page.Contract as Contract
import Page.Profile as Profile
import Session exposing (Session(..), navKey)
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
type Model
  = Home Session
  | Why Session
  | SignUp Signup.Model
  | Login Login.Model
  | Contracts Contracts.Model
  | Contract Contract.Model
  | Profile Profile.Model

init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
  changeRouteTo (fromUrl url) (Home (Guest key))


-- UPDATE
type Msg
  = LinkClicked Browser.UrlRequest
  | UrlChanged Url.Url
  | GotLoginMsg Login.Msg
  | GotSignupMsg Signup.Msg
  | GotHomeMsg Home.Msg
  | GotContractsMsg Contracts.Msg
  | GotContractMsg Contract.Msg
  | GotProfileMsg Profile.Msg
  | GotWhyMsg Why.Msg
  | NotFoundMsg

toSession : Model -> Session
toSession page =
    case page of
        Home home ->
          home

        Login login ->
          Login.toSession login
        
        SignUp signup ->
          Signup.toSession signup
        
        Contract contract ->
          Contract.toSession contract

        Contracts contracts ->
          Contracts.toSession contracts

        Why session ->
          session

        Profile profile ->
          Profile.toSession profile


updateWith : (subModel -> Model) -> (subMsg -> Msg) -> Model -> ( subModel, Cmd subMsg ) -> ( Model, Cmd Msg )
updateWith toModel toMsg model ( subModel, subCmd ) =
    ( toModel subModel
    , Cmd.map toMsg subCmd
    )

changeRouteTo : Route -> Model -> ( Model, Cmd Msg )
changeRouteTo maybeRoute model =
    let
        session =
            toSession model
    in
    case maybeRoute of
        Router.Home ->
            ( model, Cmd.none )

        Router.Why ->
            ( model, Cmd.none )

        Router.Login ->
            Login.init session
                |> updateWith Login GotLoginMsg model

        Router.SignUp ->
            Signup.init session
                |> updateWith SignUp GotSignupMsg model

        Router.Contracts ->
            Contracts.init session
                |> updateWith Contracts GotContractsMsg model

        (Router.Contract id) ->
            Contract.init session id
                |> updateWith Contract GotContractMsg model

        (Router.Profile id) ->
            Profile.init session id
                |> updateWith Profile GotProfileMsg model

        Router.NotFound ->
             ( Home (toSession model), Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case (msg, model) of
    (LinkClicked urlRequest, _) ->
      case urlRequest of
        Browser.Internal url ->
          ( model, Nav.pushUrl (navKey (toSession model)) (Url.toString url) )

        Browser.External href ->
          ( model, Nav.load href )

    (UrlChanged url, _) ->
      changeRouteTo (fromUrl url) model

    (GotHomeMsg homeMsg, Home home ) ->
      ( Home (toSession model), Cmd.none )

    (GotWhyMsg whyMsg, Why why) ->
      ( Why (toSession model), Cmd.none )

    (GotLoginMsg loginMsg, Login login) ->
      Login.update loginMsg login
        |> updateWith Login GotLoginMsg model

    (GotSignupMsg signupMsg, SignUp signup) ->
      ( SignUp signup, Cmd.none )

    (GotContractsMsg contractsMsg, Contracts contracts) ->
      ( Contracts contracts, Cmd.none )
      
    (GotContractMsg contractMsg, Contract contract) -> 
      ( Contract contract, Cmd.none )
    (GotProfileMsg profileMsg, Profile profile) ->
      ( Profile profile, Cmd.none)

    _ ->
      ( Home (toSession model), Cmd.none )

      



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

viewBody: Model -> Html Msg
viewBody model =
  let 
    viewPage page toMsg config =
            let
                { title, content } = (page config)
            in
            { title = title
            , body = (Html.map toMsg) content
            }
  in
  case model of
    Login loginModel ->
      (viewPage Login.view GotLoginMsg loginModel).body
    Home session ->
      (Home.view).content
    Why session ->
      (Why.view).content
    SignUp signupModel ->
      (Signup.view signupModel).content
    Contracts contractsModel ->
      (Contracts.view).content
    _ -> div [class "section"] [text "Nothing to see here!"]