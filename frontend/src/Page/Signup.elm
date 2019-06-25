module Page.Signup exposing (Model, Msg, init, toSession, view, update)

import Browser
import Html exposing (Html, a, button, div, figure, form, h1, h2, h4, i, img, input, label, option, p, section, select, span, text)
import Html.Attributes exposing (attribute, class, href, placeholder, src, type_, value)
import Html.Events exposing (onClick, onInput)
import Http
import Session exposing (Session)


init : Session -> ( Model, Cmd msg )
init session =
    ( { session = session
      , email = ""
      , password = ""
      , accountType = Contractor
      , firstName = ""
      , lastName = ""
      }
    , Cmd.none
    )


type AccountType
    = Organization
    | Contractor


type alias Model =
    { session : Session
    , email : String
    , password : String
    , accountType : AccountType
    , firstName : String
    , lastName : String
    }


toSession : Model -> Session
toSession model =
    model.session



-- TODO: Update this view


view : Model -> { title : String, content : Html Msg }
view model =
    { title = ""
    , content =
        div [ class "hero-body signup" ]
            [ div [ class "container" ]
                [ div [ class "columns" ]
                    [ div [ class "column is-one-quarter" ]
                        [ h1 [ class "title" ]
                            [ text "I am a "
                            , span [ class "field" ]
                                [ span [ class "control" ]
                                    [ div [ class "select is-large" ]
                                        [ select []
                                            [ option []
                                                [ text "Specialist" ]
                                            , option []
                                                [ text "Nonprofit" ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    , div [ class "column" ]
                        [ h2 [ class "is-size-3" ] [ text "Sign up" ], specialistForm model ]
                    ]
                ]
            ]
    }


specialistForm : Model -> Html Msg
specialistForm model =
    form []
        [ textfield "Email" "email" model.email "envelope" "you@thatoneplace.com" SetEmail
        , textfield "Password" "password" model.password "key" "Keep it secret, keep it safe." SetPassword
        , textfield "First Name" "text" model.firstName "signature" "" SetFirstName
        , textfield "Last Name" "text" model.lastName "signature" "" SetLastName
        , div [ class "field" ]
            [ div [ class "control" ]
                [ label [ class "checkbox" ]
                    [ input [ type_ "checkbox" ]
                        []
                    , text " I agree to the "
                    , a [ href "#" ]
                        [ text "terms and conditions" ]
                    ]
                ]
            ]
        , div [ class "field is-grouped" ]
            [ div [ class "control" ]
                [ button [ class "button is-link" ]
                    [ text "Submit" ]
                ]
            ]
        ]


textfield: String -> String -> String -> String -> String -> (String -> msg) -> Html msg
textfield inputLabel inputType inputValue icon inputPlaceholder toMsg =
    div [ class "field" ]
            [ label [ class "label" ]
                [ text inputLabel ]
            , div [ class "control has-icons-left has-icons-right" ]
                [ input [ class "input", placeholder inputPlaceholder, type_ inputType, value inputValue, onInput toMsg ]
                    []
                , span [ class "icon is-small is-left" ]
                    [ i [ class ("fas fa-" ++ icon) ]
                        []
                    ]
                ]
            ]

type Msg
    = SetFirstName String
    | SetLastName String
    | SetPassword String
    | SetEmail String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetFirstName firstName ->
            ( { model | firstName = firstName }, Cmd.none )

        SetLastName lastName ->
            ( { model | lastName = lastName }, Cmd.none )

        SetPassword password ->
            ( { model | password = password }, Cmd.none )

        SetEmail email ->
            ( { model | email = email }, Cmd.none )
