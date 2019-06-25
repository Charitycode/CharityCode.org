module Footer exposing (view)

import Html exposing (Html, a, div, footer, li, text, ul)
import Html.Attributes exposing (class, href)


view : Html msg
view =
    footer [ class "footer" ]
        [ div [ class "content columns" ]
            [ div [ class "column" ]
                [ ul [ class "is-unstyled" ]
                    [ li [ class "has-text-weight-bold" ] [ text "About" ]
                    , li [] [ footerLink "About" "/about" ]
                    , li [] [ footerLink "Privacy Policy" "/privacy"]
                    ]
                ]
            , div [ class "column" ]
                [ ul [ class "is-unstyled" ]
                    [ li [ class "has-text-weight-bold" ] [ text "Support" ]
                    , li [] [ footerLink "File an issue" "/report"]
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


footerLink: String -> String -> Html msg
footerLink linkText linkUrl =
     a [ href linkUrl, class "navbar-item" ]
        [ text linkText ]