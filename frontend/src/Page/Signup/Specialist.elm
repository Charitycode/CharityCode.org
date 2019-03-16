module Page.Signup.Specialist exposing (DeveloperModel, asFirstNameIn, asLastNameIn, view)

import Browser
import Html exposing (Html, button, div, text, input, span)
import Html.Events exposing (onClick, onInput)


type alias DeveloperModel =
    { firstName: String
    , lastName: String
    }
    
asFirstNameIn: DeveloperModel -> String -> DeveloperModel
asFirstNameIn d s =
  { d | firstName = s }
  
asLastNameIn: DeveloperModel -> String -> DeveloperModel
asLastNameIn d s =
  { d | lastName = s }

view : Model -> Html Msg
view model =
    div []
        [ span [] [ text "First Name" ]
        , input [ onInput SetFirstName ] []
        , span [] [ text "Last Name" ]
        , input [ onInput SetLastName ] []
        , div [] [ text <| (model.developerModel.firstName ++ " " ++ model.developerModel.lastName) ]
        ]