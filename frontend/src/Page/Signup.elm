module Page.Signup exposing (Model, Msg, init, toSession, view)

import Browser
import Html exposing (Html, a, button, div, figure, form, h1, h2, img, input, label, option, p, section, select, span, text)
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
    }


toSession : Model -> Session
toSession model =
    model.session



-- TODO: Update this view


view : Model -> { title : String, content : Html msg }
view model =
    { title = ""
    , content =
        div [ class "hero-body" ]
            [ div [ class "container" ]
                [ h1 [ class "title" ]
                    [ text "I am a" ]
                , div [ class "field" ]
                    [ div [ class "control" ]
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
    }


type Msg
    = Nothing
    | Success
