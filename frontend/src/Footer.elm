module Footer exposing (view)
import Html exposing (Html, div, text, ul, li, footer)
import Html.Attributes exposing (class)

view : Html msg
view =
  footer [ class "footer" ] [
      div [ class "content columns has-background-light" ]
        [ div [ class "column" ]
            [ ul []
                [ li [] [text "About"]
                , li [] [text "Bar"]
                ]
            ]
        , div [ class "column" ]
            [ ul []
                [ li [] [text "Foo"]
                , li [] [text "Bar"]
                ] ]
        , div [ class "column" ]
            [ ul []
                [ li [] [text "Foo"]
                , li [] [text "Bar"]
                ] ]
        , div [ class "column" ]
            [ ul []
                [ li [] [text "Foo"]
                , li [] [text "Bar"]
                ] ]
        ]
  ]
    