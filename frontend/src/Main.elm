module Main exposing (Model, Msg(..), init, update, view)

import Browser
import Browser.Navigation as Nav
import Footer as Footer
import Html exposing (..)
import Html.Attributes exposing (..)
import NavBar as NavBar
import Page.Contact as Contact
import Page.Contract as Contract
import Page.Contracts as Contracts
import Page.Home as Home
import Page.Login as Login
import Page.Organization as Organization
import Page.Privacy as Privacy
import Page.Profile as Profile
import Page.Signup as Signup
import Page.Why as Why
import Router exposing (Route(..), fromUrl, routeParser)
import Session exposing (Session(..), navKey)
import Url



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
    | Privacy Session
    | SignUp Signup.Model
    | Contact Contact.Model
    | Login Login.Model
    | Contracts Contracts.Model
    | Contract Contract.Model
    | Profile Profile.Model
    | Organization Organization.Model


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    changeRouteTo (fromUrl url) (Home (Guest key))



-- UPDATE


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | GotLoginMsg Login.Msg
    | GotSignupMsg Signup.Msg
    | GotContactMsg Contact.Msg
    | GotHomeMsg Home.Msg
    | GotContractsMsg Contracts.Msg
    | GotContractMsg Contract.Msg
    | GotProfileMsg Profile.Msg
    | GotWhyMsg Why.Msg
    | GotPrivacyMsg Privacy.Msg
    | GotOrganizationMsg Organization.Msg
    | NotFoundMsg


toSession : Model -> Session
toSession page =
    case page of
        Home home ->
            home

        Privacy session ->
            session

        Login login ->
            Login.toSession login

        SignUp signup ->
            Signup.toSession signup

        Contact contact ->
            Contact.toSession contact

        Contract contract ->
            Contract.toSession contract

        Contracts contracts ->
            Contracts.toSession contracts

        Why session ->
            session

        Profile profile ->
            Profile.toSession profile

        Organization org ->
            Organization.toSession org


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
            ( Home session, Cmd.none )

        Router.Why ->
            ( Why session, Cmd.none )

        Router.Privacy ->
            ( Privacy session, Cmd.none )

        Router.Login ->
            Login.init session
                |> updateWith Login GotLoginMsg model

        Router.SignUp ->
            Signup.init session
                |> updateWith SignUp GotSignupMsg model

        Router.Contact ->
            Contact.init session
                |> updateWith Contact GotContactMsg model

        Router.Contracts ->
            Contracts.init session
                |> updateWith Contracts GotContractsMsg model

        Router.Contract id ->
            Contract.init session id
                |> updateWith Contract GotContractMsg model

        Router.Profile id ->
            Profile.init session id
                |> updateWith Profile GotProfileMsg model

        Router.Organization id ->
            Organization.init session id
                |> updateWith Organization GotOrganizationMsg model

        Router.NotFound ->
            ( Home (toSession model), Cmd.none )


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case ( msg, model ) of
        ( LinkClicked urlRequest, _ ) ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl (navKey (toSession model)) (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        ( UrlChanged url, _ ) ->
            changeRouteTo (fromUrl url) model

        ( GotHomeMsg homeMsg, Home home ) ->
            ( Home (toSession model), Cmd.none )

        ( GotWhyMsg whyMsg, Why why ) ->
            ( Why (toSession model), Cmd.none )

        ( GotPrivacyMsg privacyMsg, Privacy privacy ) ->
            ( Privacy (toSession model), Cmd.none )

        ( GotLoginMsg loginMsg, Login login ) ->
            Login.update loginMsg login
                |> updateWith Login GotLoginMsg model

        ( GotSignupMsg signupMsg, SignUp signup ) ->
            ( SignUp signup, Cmd.none )

        ( GotContactMsg contactMsg, Contact contact ) ->
            Contact.update contactMsg contact
                |> updateWith Contact GotContactMsg model

        ( GotContractsMsg contractsMsg, Contracts contracts ) ->
            Contracts.update contractsMsg contracts
                |> updateWith Contracts GotContractsMsg model

        ( GotContractMsg contractMsg, Contract contract ) ->
            ( Contract contract, Cmd.none )

        ( GotProfileMsg profileMsg, Profile profile ) ->
            ( Profile profile, Cmd.none )

        ( GotOrganizationMsg organizationMsg, Organization organization ) ->
            ( Organization organization, Cmd.none )

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


viewBody : Model -> Html Msg
viewBody model =
    let
        viewPage page toMsg config =
            let
                { title, content } =
                    page config
            in
            { title = title
            , body = Html.map toMsg content
            }
    in
    case model of
        Login loginModel ->
            (viewPage Login.view GotLoginMsg loginModel).body

        Home session ->
            Home.view.content

        Why session ->
            Why.view.content

        Privacy session ->
            Privacy.view.content

        SignUp signupModel ->
            (Signup.view signupModel).content

        Contact contactModel ->
            (viewPage Contact.view GotContactMsg contactModel).body

        Contracts contractsModel ->
            (viewPage Contracts.view GotContractsMsg contractsModel).body

        Contract contractModel ->
            (viewPage Contract.view GotContractMsg contractModel).body

        Organization orgModel ->
            (viewPage Organization.view GotOrganizationMsg orgModel).body

        _ ->
            div [ class "section" ] [ text "Nothing to see here!" ]
