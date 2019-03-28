module Page.Signup exposing (view, Model, toSession, Msg, init)

import Browser
import Html exposing (Html, button, div, text, input, label, h1, h2, p, figure, section, img, form, a)
import Html.Attributes exposing (type_, placeholder, value, class, src, attribute, href)
import Html.Events exposing (onClick, onInput)
import Session exposing (Session)
import Http

init : Session -> ( Model, Cmd msg )
init session =
    ( { session = session
      , email = ""
      , password = ""
      , accountType = Contractor
      }
    , Cmd.none
    )

type AccountType
    = Organization
    | Contractor

type alias Model =
  { session: Session
  , email: String
  , password: String
  , accountType: AccountType
  }

toSession: Model -> Session
toSession model = model.session

-- TODO: Update this view
view : Model -> { title : String, content : Html msg }
view model =
  { title = ""
  , content = div [ class "hero-body" ]
    [ div [ class "container" ]
        [ h1 [ class "title" ]
            [ text "Coming soon." ]
        ]
    ]}
    

type Msg
  = Nothing
  | Success