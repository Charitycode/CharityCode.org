module Page.Contracts exposing (view)

import Browser
import Html exposing (Html, table, thead, tr, th, tfoot, tbody, td, div, text, h1, p, a)
import Html.Attributes exposing (type_, placeholder, value, class, src, attribute, href)
import Html.Events exposing (onClick, onInput)
import Http

view : { title : String, content : Html msg }
view =
  { title = "What is Charity Code?"
  , content = div [ class "hero-body content is-medium" ]
    [ div [ class "container" ]
        [ h1 [ ]
            [ text "Contracts" ]
        , tableFields
        ]
    ]}

titleFields: Html msg
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

tableFields: Html msg
tableFields = table [ class "table" ]
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