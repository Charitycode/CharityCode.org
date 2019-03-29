module Page.Contract exposing (Model, Msg, init, toSession, view)

import Html exposing (Html, a, button, div, figure, form, h3, i, img, input, label, p, section, span, text)
import Html.Attributes exposing (attribute, class, href, placeholder, src, type_, value)
import Html.Events exposing (onClick, onInput)
import Session exposing (Session)


type alias Model =
    { session : Session
    , id : Int
    }


init : Session -> Int -> ( Model, Cmd msg )
init session id =
    ( { session = session
      , id = id
      }
    , Cmd.none
    )


toSession : Model -> Session
toSession model =
    model.session


view : Model -> { title : String, content : Html Msg }
view model =
    { title = "Login"
    , content =
        div [ class "section" ]
            [ div [ class "container" ]
                [ div [ class "card" ]
                    [ div [ class "card-content" ]
                        [ div [ class "cc-heading" ]
                            [ div [ class "title" ]
                                [ text "model.title" ]
                            , div [ class "subtitle" ]
                                [ text "model.organization" ]
                            ]
                        , div [ class "content" ]
                            [ text "description?" ]
                        ]
                    ]
                ]
            ]
    }


type Msg
    = Nothing
    | Something
