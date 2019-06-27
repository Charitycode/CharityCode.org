module Page.Login exposing (Model, Msg, asEmailIn, asPasswordIn, init, toSession, update, view)

import Browser
import Html exposing (Html, a, button, div, figure, form, h3, i, img, input, label, p, section, span, text)
import Html.Attributes exposing (attribute, class, href, placeholder, src, type_, value)
import Html.Events exposing (onClick, onInput)
import Http
import Session exposing (Session, navKey)


init : Session -> ( Model, Cmd msg )
init session =
    ( { session = session
      , password = ""
      , email = ""
      }
    , Cmd.none
    )


type alias Model =
    { email : String
    , password : String
    , session : Session
    }


toSession : Model -> Session
toSession model =
    model.session


asEmailIn : Model -> String -> Model
asEmailIn d s =
    { d | email = s }


asPasswordIn : Model -> String -> Model
asPasswordIn d s =
    { d | password = s }


view : Model -> { title : String, content : Html Msg }
view model =
    { title = "Login"
    , content =
        div [ class "columns is-vcentered" ]
            [ div [ class "login column is-4 " ]
                [ section [ class "section" ]
                    [ div [ class "has-text-centered" ]
                        [ h3 [ class "is-size-4" ] [ text "Sign in to"]
                        , img [ class "login-logo", src "/charity-code-full-logo.png" ]
                            []
                        ]
                    , div [ class "field" ]
                        [ label [ class "label" ]
                            [ text "Email" ]
                        , div [ class "control" ]
                            [ input [ class "input", type_ "text", onInput EnteredEmail, value model.email ]
                                []
                        ]
                    , div [ class "field" ]
                        [ label [ class "label" ]
                            [ text "Password" ]
                        , div [ class "control" ]
                            [ input [ class "input", type_ "password", onInput EnteredPassword, value model.password ]
                                []
                            ]
                        ]
                    ]
                    , div [ class "has-text-centered" ]
                        [ button [ class "button is-vcentered is-primary is-outlined", onClick SubmittedForm ]
                            [ text "Login" ]
                        ]
                    , div [ class "has-text-centered" ]
                        [ a [ href "/signup" ]
                            [ text "Don't you have an account? Sign up now!" ]
                        ]
                    ]
                ]
            , div [ class "interactive-bg column is-8" ]
                []
            ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        EnteredEmail email ->
            ( { model | email = email }, Cmd.none )

        EnteredPassword password ->
            ( { model | password = password }, Cmd.none )

        SubmittedForm ->
            ( { model | password = "", email = "", session = (Session.LoggedIn (navKey model.session))}, Cmd.none)



-- Update


type Msg
    = SubmittedForm
    | EnteredEmail String
    | EnteredPassword String
