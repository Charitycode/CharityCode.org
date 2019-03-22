module Page.Signup exposing (view)

import Browser
import Html exposing (Html, button, div, text, input, label, h1, h2, p, figure, section, img, form, a)
import Html.Attributes exposing (type_, placeholder, value, class, src, attribute, href)
import Html.Events exposing (onClick, onInput)
import Http

-- TODO: Update this view
view : { title : String, content : Html msg }
view =
  { title = ""
  , content = div [ class "hero-body" ]
    [ div [ class "container" ]
        [ h1 [ class "title" ]
            [ text "Coming soon." ]
        ]
    ]}
    