module Page.Login exposing (Model, asEmailIn, asPasswordIn, view, init, toSession, Msg)

import Browser
import Html exposing (Html, button, div, text, input, label, h3, p, figure, section, img, form, a, span, i)
import Html.Attributes exposing (type_, placeholder, value, class, src, attribute, href)
import Html.Events exposing (onClick, onInput)
import Session exposing (Session)
import Http


init : Session -> ( Model, Cmd msg )
init session =
    ( { session = session
      , password = ""
      , email = ""
      }
    , Cmd.none
    )


type alias Model =
    { email: String
    , password: String
    , session: Session
    }

toSession: Model -> Session
toSession model = model.session
    
asEmailIn: Model -> String -> Model
asEmailIn d s =
  { d | email = s }
  
asPasswordIn: Model -> String -> Model
asPasswordIn d s =
  { d | password = s }

view : Model -> { title : String, content : Html msg }
view model =
    { title = "Login"
    ,  content = div [ class "columns is-vcentered" ]
    [ div [ class "login column is-4 " ]
        [ section [ class "section" ]
            [ div [ class "has-text-centered" ]
                [ img [ class "login-logo", src "" ]
                    []
                ]
            , div [ class "field" ]
                [ label [ class "label" ]
                    [ text "Username" ]
                , div [ class "control has-icons-right" ]
                    [ input [ class "input", type_ "text" ]
                        []
                    , span [ class "icon is-small is-right" ]
                        [ i [ class "fa fa-user" ]
                            []
                        ]
                    ]
                ]
            , div [ class "field" ]
                [ label [ class "label" ]
                    [ text "Password" ]
                , div [ class "control has-icons-right" ]
                    [ input [ class "input", type_ "password" ]
                        []
                    , span [ class "icon is-small is-right" ]
                        [ i [ class "fa fa-key" ]
                            []
                        ]
                    ]
                ]
            , div [ class "has-text-centered" ]
                [ a [ class "button is-vcentered is-primary is-outlined" ]
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

-- Update
type Msg
    = SubmittedForm
    | EnteredEmail String
    | EnteredPassword String