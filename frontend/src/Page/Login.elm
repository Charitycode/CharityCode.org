module Page.Login exposing (LoginModel, asEmailIn, asPasswordIn, view)

import Browser
import Html exposing (Html, button, div, text, input, label, h3, p, figure, section, img, form, a)
import Html.Attributes exposing (type_, placeholder, value, class, src, attribute, href)
import Html.Events exposing (onClick, onInput)
import Http


type alias LoginModel =
    { email: String
    , password: String
    }
    
asEmailIn: LoginModel -> String -> LoginModel
asEmailIn d s =
  { d | email = s }
  
asPasswordIn: LoginModel -> String -> LoginModel
asPasswordIn d s =
  { d | password = s }

view : LoginModel -> { title : String, content : Html msg }
view model =
    { title = "Login"
    ,  content = section [ class "hero is-success is-fullheight" ]
      [ div [ class "hero-body" ]
          [ div [ class "container has-text-centered" ]
              [ div [ class "column is-4 is-offset-4" ]
                  [ h3 [ class "title has-text-grey" ]
                      [ text "Login" ]
                  , p [ class "subtitle has-text-grey" ]
                      [ text "Please login to proceed." ]
                  , div [ class "box" ]
                      [ figure [ class "avatar" ]
                          [ img [ src "https://placehold.it/128x128" ]
                              []
                          ]
                      , form []
                          [ div [ class "field" ]
                              [ div [ class "control" ]
                                  [ input [ attribute "autocomplete" "off", attribute "autofocus" "", class "input is-large", placeholder "Your Email", type_ "email" ]
                                      []
                                  ]
                              ]
                          , div [ class "field" ]
                              [ div [ class "control" ]
                                  [ input [ attribute "autocomplete" "off", class "input is-large", placeholder "Your Password", type_ "password" ]
                                      []
                                  ]
                              ]
                          , div [ class "field" ]
                              [ label [ class "checkbox" ]
                                  [ input [ type_ "checkbox" ]
                                      []
                                  , text "Remember me                "
                                  ]
                              ]
                          , button [ class "button is-block is-info is-large is-fullwidth" ]
                              [ text "Login" ]
                          ]
                      ]
                  , p [ class "has-text-grey" ]
                      [ a [ href "../" ]
                          [ text "Sign Up" ]
                      , text " ·                         "
                      , a [ href "../" ]
                          [ text "Forgot Password" ]
                      , text " ·                         "
                      , a [ href "../" ]
                          [ text "Need Help?" ]
                      ]
                  ]
              ]
          ]
      ]
    }

-- Update
type Msg
    = SubmittedForm
    | EnteredEmail String
    | EnteredPassword String