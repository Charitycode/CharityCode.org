module NavBar exposing (view)

import Html exposing (Html, nav, div, a, img, span, text, hr, strong)
import Html.Attributes exposing (attribute, class, href, src, id)

type Msg = Nothing

type alias Model =
    { 
    }

view : Model -> Html Msg 
view model = 
    nav [ attribute "aria-label" "main navigation", class "navbar", attribute "role" "navigation" ]
    [ div [ class "navbar-brand" ]
        [ a [ class "navbar-item", href "#" ]
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
            [ a [ class "navbar-item" ]
                [ text "Home      " ]
            , a [ class "navbar-item" ]
                [ text "Why      " ]
            , div [ class "navbar-item has-dropdown is-hoverable" ]
                [ a [ class "navbar-link" ]
                    [ text "More        " ]
                , div [ class "navbar-dropdown" ]
                    [ a [ class "navbar-item" ]
                        [ text "About          " ]
                    , a [ class "navbar-item" ]
                        [ text "Jobs          " ]
                    , a [ class "navbar-item" ]
                        [ text "Contact          " ]
                    , hr [ class "navbar-divider" ]
                        []
                    , a [ class "navbar-item" ]
                        [ text "Report an issue          " ]
                    ]
                ]
            ]
        , div [ class "navbar-end" ]
            [ div [ class "navbar-item" ]
                [ div [ class "buttons" ]
                    [ a [ class "button is-primary" ]
                        [ strong []
                            [ text "Sign up" ]
                        ]
                    , a [ class "button is-light" ]
                        [ text "Log in          " ]
                    ]
                ]
            ]
        ]
    ]