module Page.Contracts exposing (Model, Msg, init, toSession, view, update)

import Browser
import Html exposing (Html, a, div, h1, h4, p, table, tbody, td, text, tfoot, th, thead, tr)
import Html.Attributes exposing (attribute, class, href, placeholder, src, type_, value)
import Html.Events exposing (onClick, onInput)
import Http
import Api.Endpoint
import Session exposing (Session)
import Contract exposing (Contract, contractsDecoder)


type alias Model =
    { session : Session
    , contracts: List Contract
    }


init : Session -> ( Model, Cmd Msg )
init session =
    ( { session = session
      , contracts = []
      }
    , Http.get
      { url = Api.Endpoint.contracts
      , expect = Http.expectJson GotContracts contractsDecoder
      }
    )


toSession : Model -> Session
toSession model =
    model.session


view : Model -> { title : String, content : Html msg }
view model =
    { title = "What is Charity Code?"
    , content =
        div [ class "hero-body content is-medium" ]
            [ div [ class "container" ]
                [ h1 []
                    [ text "Contracts" ]
                , if List.isEmpty model.contracts then noContracts else tableFields model.contracts
                ]
            ]
    }


titleFields : Html msg
titleFields =
    tr []
        [ th []
            [ text "Title" ]
        , th []
            [ text "Type" ]
        , th []
            [ text "Compensation" ]
        , th []
            [ text "Poster" ]
        , th []
            [ text "Date Posted" ]
        ]

noContracts : Html msg
noContracts = 
    h4 [] [text "No contracts found! Either that or an error occured!"]

-- TODO: Wire this up to the contract
tableFields : (List Contract) -> Html msg
tableFields contracts =
    table [ class "table" ]
        [ thead []
            [ titleFields ]
        , tfoot []
            [ titleFields ]
        , tbody []
            ( List.map tableRow contracts )
        ]

tableRow : Contract -> Html msg
tableRow contract =
    tr []
        [ th []
            [ a [ href "/contracts/1" ]
                [ text contract.title ]
            ]
        , td []
            [ text contract.contractType ]
        , td []
            [ text contract.compensation ]
        , td []
            [ a [ href "/organization/1" ]
                [ text "My NonProfit" ]
            ]
        , td []
            [ text contract.postDate ]
        ]
-- UPDATE

type Msg
    = GotContracts (Result Http.Error (List Contract))

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotContracts result ->
            case result of 
                Ok contracts ->
                    ( { model | contracts = contracts }, Cmd.none )
                Err _ ->
                    ( { model | contracts = []}, Cmd.none )
