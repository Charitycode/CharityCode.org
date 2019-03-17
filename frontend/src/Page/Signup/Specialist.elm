module Signup.Organization exposing (SignupModel, asEmailIn, asPasswordIn, view)

import Browser
import Html exposing (Html, button, div, text, input, label)
import Html.Attributes exposing (type_, placeholder, value)
import Html.Events exposing (onClick, onInput)
import Http


type alias SignupModel =
    { email: String
    , password: String
    , firstName: String
    , lastName: String
    }
    
asEmailIn: SignupModel -> String -> SignupModel
asEmailIn d s =
  { d | email = s }
  
asPasswordIn: SignupModel -> String -> SignupModel
asPasswordIn d s =
  { d | password = s }

asFirstNameIn: SignupModel -> String -> SignupModel
asFirstNameIn d s =
  { d | firstName = s }

asLastNameIn: SignupModel -> String -> SignupModel
asLastNameIn d s =
  { d | lastName = s }

view : SignupModel -> { title : String, content : Html Msg }
view model =
    { title = "Login"
    ,  content = div []
            [ label [] [ text "Email", input [ type_ "text", placeholder "MyAwesomeEmail@xyz.com", value model.email, onInput EnteredEmail ] [] ]
            , label [] [ text "Password", input [ type_ "password", placeholder "Keep it secret!", value model.password, onInput EnteredPassword ] [] ]
            , label [] [ text "First Name", input [ type_ "text", placeholder "James, perhaps?", value model.firstName, onInput EnteredPassword ] [] ]
            , label [] [ text "Last Name", input [ type_ "text", placeholder "How about Abrahms?", value model.lastName, onInput EnteredPassword ] [] ]
            , div [] [ text <| (model.email ++ " " ++ model.password) ]
            ]
    }

-- Update
type Msg
    = SubmittedForm
    | EnteredEmail String
    | EnteredPassword String