module Session exposing (Session(..), navKey)

import Browser.Navigation as Nav

type Session
    = LoggedIn Nav.Key
    | Guest Nav.Key

navKey : Session -> Nav.Key
navKey session =
    case session of
        LoggedIn key ->
            key

        Guest key ->
            key
