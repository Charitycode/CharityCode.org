module Page.Home exposing (Msg, view)

import Browser
import Html exposing (Html, a, button, div, figure, form, h1, h2, img, input, label, p, section, text)
import Html.Attributes exposing (attribute, class, href, placeholder, src, type_, value)
import Html.Events exposing (onClick, onInput)
import Http


view : { title : String, content : Html msg }
view =
    { title = ""
    , content =
        div [ class "hero-body section columns is-vcentered is-fullvh" ]
            [ div [ class "container has-text-centered" ]
                [ h1 [ class "title" ]
                    [ text "Finding development help for Nonprofits is difficult." ]
                , h2 [ class "subtitle" ]
                    [ text "We're hoping to change that." ]
                , a [ class "button is-primary", href "/why" ]
                    [ text "Learn How" ]
                ]
            ]
    }


type Msg
    = Nothing
    | Something
