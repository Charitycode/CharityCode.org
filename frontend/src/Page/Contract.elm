module Page.Contract exposing (Model, toSession, Msg, init)

import Session exposing (Session)

type alias Model =
  { session: Session,
    id: Int
  }

init : Session -> Int -> ( Model, Cmd msg )
init session id =
    ( { session = session
      , id = id
      }
    , Cmd.none
    )
toSession: Model -> Session
toSession model = model.session

type Msg 
  = Nothing
  | Something