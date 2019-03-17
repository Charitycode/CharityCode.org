module Page.Login exposing (LoginModel, asEmailIn, asPasswordIn, view)

import Browser
import Html exposing (Html, button, div, text, input, label)
import Html.Attributes exposing (type_, placeholder, value)
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

view : LoginModel -> { title : String, content : Html Msg }
view model =
    { title = "Login"
    ,  content = div []
            [ label [] [ text "Email", input [ type_ "text", placeholder "MyAwesomeEmail@xyz.com", value model.email, onInput EnteredEmail ] [] ]
            , label [] [ text "Password", input [ type_ "password", placeholder "Keep it secret!", value model.password, onInput EnteredPassword ] [] ]
            , div [] [ text <| (model.email ++ " " ++ model.password) ]
            ]
    }

-- Update
type Msg
    = SubmittedForm
    | EnteredEmail String
    | EnteredPassword String