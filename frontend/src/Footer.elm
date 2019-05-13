module Footer exposing (view)

import Html exposing (Html, a, div, footer, li, text, ul)
import Html.Attributes exposing (class, href)


view : Html msg
view =
    footer [ class "footer" ]
        [ div [ class "content columns has-background-light" ]
            [ div [ class "column" ]
                [ ul [ class "is-unstyled" ]
                    [ li [ class "has-text-weight-bold" ] [ text "About" ]
                    , li []
                        [ a [ href "/about", class "navbar-item" ]
                            [ text "About" ]
                        ]
                    , li []
                        [ a [ href "/privacy", class "navbar-item" ]
                            [ text "Privacy Policy" ]
                        ]
                    ]
                ]
            , div [ class "column" ]
                [ ul [ class "is-unstyled" ]
                    [ li [ class "has-text-weight-bold" ] [ text "Support" ]
                    , li [] [ text "File an issue" ]
                    ]
                ]
            , div [ class "column" ]
                [ ul [ class "is-unstyled" ]
                    [ li [ class "has-text-weight-bold" ] [ text "Account" ]
                    , li [] [ text "My Account" ]
                    ]
                ]
            ]
        ]
