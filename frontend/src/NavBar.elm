module NavBar exposing (view)

import Html exposing (Html, nav, div, a, img, span, text, hr, strong)
import Html.Attributes exposing (attribute, class, href, src, id)

type Msg = Nothing

type alias Model =
    { 
    }

view : Model -> Html msg 
view model = 
    nav [ attribute "aria-label" "main navigation", class "navbar", attribute "role" "navigation" ]
    [ div [ class "navbar-brand" ]
        [ a [ class "navbar-item", href "/home" ]
            [ img [ attribute "height" "28", src "https://bulma.io/images/bulma-logo.png", attribute "width" "112" ]
                []
            ]
        , a [ attribute "aria-expanded" "false", attribute "aria-label" "menu", class "navbar-burger burger", attribute "data-target" "navbarBasicExample", attribute "role" "button" ]
            [ span [ attribute "aria-hidden" "true" ]
                []
            , span [ attribute "aria-hidden" "true" ]
                []
            , span [ attribute "aria-hidden" "true" ]
                []
            ]
        ]
    , div [ class "navbar-menu", id "navbarBasicExample" ]
        [ div [ class "navbar-start" ]
            [ a [ href "/home", class "navbar-item" ]
                [ text "Home" ]
            , a [ href "/why", class "navbar-item" ]
                [ text "Why" ]
            , div [ class "navbar-item has-dropdown is-hoverable" ]
                [ a [ class "navbar-link" ]
                    [ text "More" ]
                , div [ class "navbar-dropdown" ]
                    [ a [ href "/about", class "navbar-item" ]
                        [ text "About" ]
                    , a [ href "/contracts", class "navbar-item" ]
                        [ text "Contracts" ]
                    , a [ href "/contact", class "navbar-item" ]
                        [ text "Contact" ]
                    , hr [ class "navbar-divider" ]
                        []
                    , a [ href "/report", class "navbar-item" ]
                        [ text "Report an issue" ]
                    ]
                ]
            ]
        , div [ class "navbar-end" ]
            [ div [ class "navbar-item" ]
                [ div [ class "buttons" ]
                    [ a [ href "/signup", class "button is-primary" ]
                        [ strong []
                            [ text "Sign up" ]
                        ]
                    , a [ href "/login", class "button is-light" ]
                        [ text "Log in" ]
                    ]
                ]
            ]
        ]
    ]

viewLink : String -> String -> Html msg
viewLink path copy =
  a [ href path ] [ text copy ]