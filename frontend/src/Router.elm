module Router exposing (Route(..), routeParser, fromUrl)
import Url
import Url.Parser as Parser exposing (Parser, (</>), int, map, oneOf, s, string)
import Browser.Navigation as Nav

type Route
  = Home
  | Why
  | Login
  | SignUp
  | Contracts
  | Contract Int
  | Profile String
  | NotFound

  

routeParser : Parser (Route -> a) a
routeParser = 
  oneOf
    [ map Home (s "home")
    , map Login (s "login")
    , map Why (s "why")
    , map SignUp (s "signup")
    , map Contracts (s "contracts")
    , map Contract (s "contract" </> int)
    , map Profile (s "profile" </> string)
    ]

fromUrl : Url.Url -> Route
fromUrl url =
  Maybe.withDefault NotFound (Parser.parse routeParser url)
