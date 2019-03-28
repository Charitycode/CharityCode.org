module Page.Contracts exposing (Model, Msg, init, toSession, view)

import Browser
import Html exposing (Html, a, div, h1, p, table, tbody, td, text, tfoot, th, thead, tr)
import Html.Attributes exposing (attribute, class, href, placeholder, src, type_, value)
import Html.Events exposing (onClick, onInput)
import Http
import Session exposing (Session)


type alias Model =
    { session : Session
    }


init : Session -> ( Model, Cmd msg )
init session =
    ( { session = session
      }
    , Cmd.none
    )


toSession : Model -> Session
toSession model =
    model.session


view : { title : String, content : Html msg }
view =
    { title = "What is Charity Code?"
    , content =
        div [ class "hero-body content is-medium" ]
            [ div [ class "container" ]
                [ h1 []
                    [ text "Contracts" ]
                , tableFields
                ]
            ]
    }


titleFields : Html msg
titleFields =
    tr []
        [ th []
            [ text "Title" ]
        , th []
            [ text "Type" ]
        , th []
            [ text "Compensation" ]
        , th []
            [ text "Poster" ]
        , th []
            [ text "Date Posted" ]
        ]


tableFields : Html msg
tableFields =
    table [ class "table" ]
        [ thead []
            [ titleFields ]
        , tfoot []
            [ titleFields ]
        , tbody []
            [ tr []
                [ th []
                    [ a [ href "/contracts/1" ]
                        [ text "Fix our website!" ]
                    ]
                , td []
                    [ text "Web Design" ]
                , td []
                    [ text "N/A" ]
                , td []
                    [ a [ href "/organization/1" ]
                        [ text "My NonProfit" ]
                    ]
                , td []
                    [ text "4/17/1993" ]
                ]
            ]
        ]


type Msg
    = Nothing
    | Something
