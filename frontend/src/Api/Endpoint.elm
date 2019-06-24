module Api.Endpoint exposing (contracts)

import Http
import Url.Builder exposing (QueryParameter)


root = "https://charity-code-api.herokuapp.com"

contracts = root ++ "/contracts/"