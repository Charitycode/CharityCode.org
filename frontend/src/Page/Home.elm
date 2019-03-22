module Page.Home exposing (view)

import Browser
import Html exposing (Html, button, div, text, input, label, h1, h2, p, figure, section, img, form, a)
import Html.Attributes exposing (type_, placeholder, value, class, src, attribute, href)
import Html.Events exposing (onClick, onInput)
import Http

view : { title : String, content : Html msg }
view =
  { title = ""
  , content = div [ class "hero-body section columns is-vcentered is-fullvh" ]
    [ div [ class "container has-text-centered" ]
        [ h1 [ class "title" ]
            [ text "Finding development help for Nonprofits is difficult." ]
        , h2 [ class "subtitle" ]
            [ text "We're hoping to change that." ]
        , a [ class "button is-primary", href "/why" ]
            [ text "Learn How" ]
        ]
    ]}
    