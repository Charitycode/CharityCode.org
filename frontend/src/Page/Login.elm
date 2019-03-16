module Page.Login exposing (LoginModel, asEmailIn, asPasswordIn, view)

import Browser
import Html exposing (Html, button, div, text, input, span)
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
            [ span [] [ text "First Name" ]
            , input [ onInput EnteredEmail ] []
            , span [] [ text "Last Name" ]
            , input [ onInput EnteredPassword ] []
            , div [] [ text <| (model.developerModel.firstName ++ " " ++ model.developerModel.lastName) ]
            ]
    }

-- Update
type Msg
    = SubmittedForm
    | EnteredEmail String
    | EnteredPassword String
    | CompletedLogin (Result Http.Error Viewer)
    | GotSession Session