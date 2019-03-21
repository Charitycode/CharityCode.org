module Footer exposing (view)
import Html exposing (Html, div, text, ul, li, footer)
import Html.Attributes exposing (class)

view : Html msg
view =
  footer [ class "footer" ] [
      div [ class "content columns has-background-light" ]
        [ div [ class "column" ]
            [ ul [ class "is-unstyled" ]
                [ li [ class "has-text-weight-bold" ] [ text "About" ]
                , li [] [ text "About Us" ]
                , li [] [ text "Privacy Policy" ]
                ]
            ]
        , div [ class "column" ]
            [ ul [ class "is-unstyled" ]
                [ li [ class "has-text-weight-bold" ] [text "Support"]
                , li [] [text "File an issue"]
                ]
            ]
        , div [ class "column" ]
            [ ul [ class "is-unstyled" ]
                [ li [ class "has-text-weight-bold" ] [text "Account"]
                , li [] [text "My Account"]
                ] 
            ]
        ]
  ]
    