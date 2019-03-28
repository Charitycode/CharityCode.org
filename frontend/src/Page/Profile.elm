module Page.Profile exposing (Model, Msg, init, toSession)

import Session exposing (Session)


toSession : Model -> Session
toSession model =
    model.session


type alias Model =
    { session : Session
    , id : String
    }


init : Session -> String -> ( Model, Cmd msg )
init session id =
    ( { session = session
      , id = id
      }
    , Cmd.none
    )


type Msg
    = Nothing
    | Something
