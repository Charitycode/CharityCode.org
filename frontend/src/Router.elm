module Router exposing (Route(..), fromUrl, routeParser)

import Browser.Navigation as Nav
import Url
import Url.Parser as Parser exposing ((</>), Parser, int, map, oneOf, s, string)


type Route
    = Home
    | Why
    | Login
    | SignUp
    | Contact
    | Contracts
    | Contract Int
    | Profile String
    | Organization Int
    | NotFound


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Home (s "home")
        , map Login (s "login")
        , map Why (s "why")
        , map SignUp (s "signup")
        , map Contact (s "contact")
        , map Contracts (s "contracts")
        , map Contract (s "contracts" </> int)
        , map Profile (s "profile" </> string)
        , map Organization (s "organization" </> int)
        ]


fromUrl : Url.Url -> Route
fromUrl url =
    Maybe.withDefault NotFound (Parser.parse routeParser url)
