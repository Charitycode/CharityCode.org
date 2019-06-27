module Page.Signup exposing (Model, Msg, init, toSession, view, update)

import Browser
import Html exposing (Html, a, button, div, figure, form, h1, h2, h4, i, img, input, label, option, p, section, select, span, text)
import Html.Attributes exposing (attribute, class, href, placeholder, src, type_, value)
import Html.Events exposing (onClick, onInput)
import Http
import Session exposing (Session)


init : Session -> ( Model, Cmd msg )
init session =
    ( { session = session
      , email = ""
      , password = ""
      , accountType = Specialist
      , firstName = ""
      , lastName = ""
      , organizationName = ""
      , ein = ""
      , taxId = ""
      }
    , Cmd.none
    )


type AccountType
    = Organization
    | Specialist


type alias Model =
    { session : Session
    , email : String
    , password : String
    , accountType : AccountType
    , firstName : String
    , lastName : String
    , organizationName : String
    , ein : String
    , taxId : String
    }


toSession : Model -> Session
toSession model =
    model.session



-- TODO: Update this view


view : Model -> { title : String, content : Html Msg }
view model =
    { title = ""
    , content =
        div [ class "hero-body signup" ]
            [ div [ class "container" ]
                [ div [ class "columns" ]
                    [ div [ class "column is-one-quarter" ]
                        [ h1 [ class "title" ]
                            [ text "I am a "
                            , span [ class "field" ]
                                [ span [ class "control" ]
                                    [ div [ class "select is-large" ]
                                        [ select [ onInput SetAccountType ]
                                            [ option []
                                                [ text "Specialist" ]
                                            , option []
                                                [ text "Nonprofit" ]
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        , h2 [ class "is-size-4" ]
                            [ text ("What is a " ++ accountTypeAsString model ++ "?") ]
                        , p [] [ text (getAccountTypeDescription model) ]
                        ]
                    , div [ class "column" ]
                        [ h2 [ class "is-size-3" ] [ text "Sign up" ], 
                        case model.accountType of
                            Organization ->
                                organizationForm model
                            Specialist ->
                                specialistForm model ]
                    ]
                ]
            ]
    }

getAccountTypeDescription : Model -> String
getAccountTypeDescription m =
    case m.accountType of
        Specialist ->
            "A specialist is a programmer, designer, marketing person, or just an individual with some skill that can be of value to nonprofits."
        Organization ->
            "A nonprofit is a specific type of organization that is focused on running business that gives back to the community or helps those in need."

accountTypeAsString : Model -> String
accountTypeAsString m =
    case m.accountType of
        Specialist ->
            "Specialist"
        Organization ->
            "Nonprofit"

organizationForm : Model -> Html Msg
organizationForm model =
    form []
        [ textfield "Organization Name" "text" model.organizationName "building" "Awesome Charity Name!" SetOrganizationName
        , textfield "Organization EIN" "text" model.ein "certificate" "12345689" SetEIN
        , textfield "Tax ID" "text" model.taxId "clipboard" "123456789" SetTaxId
        , textfield "Admin Email" "email" model.email "envelope" "you@thatoneplace.com" SetEmail
        , textfield "Admin Password" "password" model.password "key" "Keep it secret, keep it safe." SetPassword
        , div [ class "field" ]
            [ div [ class "control" ]
                [ label [ class "checkbox" ]
                    [ input [ type_ "checkbox" ]
                        []
                    , text " I agree to the "
                    , a [ href "#" ]
                        [ text "terms and conditions" ]
                    ]
                ]
            ]
        , div [ class "field is-grouped" ]
            [ div [ class "control" ]
                [ button [ class "button is-link" ]
                    [ text "Submit" ]
                ]
            ]
        ]



specialistForm : Model -> Html Msg
specialistForm model =
    form []
        [ textfield "Email" "email" model.email "envelope" "you@thatoneplace.com" SetEmail
        , textfield "Password" "password" model.password "key" "Keep it secret, keep it safe." SetPassword
        , textfield "First Name" "text" model.firstName "signature" "" SetFirstName
        , textfield "Last Name" "text" model.lastName "signature" "" SetLastName
        , div [ class "field" ]
            [ div [ class "control" ]
                [ label [ class "checkbox" ]
                    [ input [ type_ "checkbox" ]
                        []
                    , text " I agree to the "
                    , a [ href "#" ]
                        [ text "terms and conditions" ]
                    ]
                ]
            ]
        , div [ class "field is-grouped" ]
            [ div [ class "control" ]
                [ button [ class "button is-link" ]
                    [ text "Submit" ]
                ]
            ]
        ]


textfield: String -> String -> String -> String -> String -> (String -> msg) -> Html msg
textfield inputLabel inputType inputValue icon inputPlaceholder toMsg =
    div [ class "field" ]
            [ label [ class "label" ]
                [ text inputLabel ]
            , div [ class "control" ]
                [ input [ class "input", placeholder inputPlaceholder, type_ inputType, value inputValue, onInput toMsg ]
                    []
                -- Unfortunately, this currently breaks some stuff with elm for some reason?
                -- might be class related on the SVG that gets pulled in
                -- span [ class "icon is-small is-left" ]
                --     [ i [ class ("fas fa-" ++ icon) ]
                --         []
                --     ]
                -- ]
                ]
            ]

type Msg
    = SetFirstName String
    | SetLastName String
    | SetPassword String
    | SetEmail String
    | SetOrganizationName String
    | SetEIN String
    | SetTaxId String
    | SetAccountType String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetFirstName firstName ->
            ( { model | firstName = firstName }, Cmd.none )

        SetLastName lastName ->
            ( { model | lastName = lastName }, Cmd.none )

        SetPassword password ->
            ( { model | password = password }, Cmd.none )

        SetEmail email ->
            ( { model | email = email }, Cmd.none )

        SetOrganizationName name ->
            ( {model | organizationName = name}, Cmd.none ) 

        SetEIN name ->
            ( {model | ein = name}, Cmd.none ) 

        SetTaxId name ->
            ( {model | taxId = name}, Cmd.none ) 

        SetAccountType accountType ->
            case accountType of
                "Specialist" ->
                    ( {model | accountType = Specialist}, Cmd.none ) 
                _ ->
                    ( {model | accountType = Organization}, Cmd.none ) 