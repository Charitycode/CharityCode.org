module Page.Contact exposing (Model, Msg, init, toSession, view, update)

import Browser
import Html exposing (Html, i, button, div, form, h1, input, label, span, text, textarea, p)
import Html.Attributes exposing (attribute, class, href, placeholder, src, type_, value)
import Html.Events exposing (onClick, onInput, onSubmit)
import Http
import Session exposing (Session)

-- MODEL

type alias Model =
    { session : Session
    , email : String
    , name : String
    , message : String
    }

toSession : Model -> Session
toSession model =
    model.session

init : Session -> ( Model, Cmd msg )
init session =
    (   { session = session
        , email = ""
        , name = ""
        , message = ""
        }
    , Cmd.none
    )


-- VIEW


view : Model -> { title : String, content : Html Msg }
view model =
    { title = ""
    , content =
        div [ class "hero-body section" ]
            [ div [ class "container content" ]
                [ h1 []
                    [
                        text "Contact Us!"
                    ]
                , p [ class "is-small" ] [
                        text "We love hearing from our users and improving ourselves based on their feedback."
                    ]
                , form [ class "form", onSubmit SubmittedForm ]
                    [ viewFormInput "Email" "Your E-Mail" "fa fa-envelope" EnteredEmail model.email
                    , viewFormInput "Name" "Your Name" "fa fa-user" EnteredName model.name
                    , viewFormTextarea "Message" "What's on your mind?" EnteredMessage model.message
                    , button [ class "button", type_ "submit" ]
                        [ text "Submit"
                        ]
                    ]
                ]
            ]
    }

viewFormInput : String -> String -> String -> (String -> Msg) -> String -> Html Msg
viewFormInput labelText placeholderText iconClass msg val =
  div [ class "field" ]
    [ label [ class "label" ]
        [ text labelText
        ]
    , div [ class "control has-icons-right" ]
        [ input [ class "input", type_ "text", placeholder placeholderText, onInput msg, value val ]
            []
        , span [ class "icon is-small is-right" ]
            [ i [ class iconClass ]
                [

                ]
            ]
        ]
    ]

viewFormTextarea : String -> String -> (String -> Msg) -> String -> Html Msg
viewFormTextarea labelText placeholderText msg val =
    div [ class "field" ]
        [ label [ class "label" ]
            [ text labelText 
            ]
        , textarea [ class "textarea", placeholder placeholderText, onInput msg, value val ]
            [

            ]
        ]

-- UPDATE

type Msg
    = EnteredEmail String
    | EnteredName String
    | EnteredMessage String
    | SubmittedForm

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        EnteredEmail email ->
            ( { model | email = email }, Cmd.none )

        EnteredName name ->
            ( { model | name = name }, Cmd.none )

        EnteredMessage message ->
            ( { model | message = message }, Cmd.none )

        SubmittedForm ->
            ( { model | session = model.session, email = "", name = "", message = "" }, Cmd.none)
