module Page.Contract exposing (Model, Msg, init, toSession, view)

import Html exposing (Html, a, button, div, figure, form, h1, h2, h3, i, img, input, label, p, section, span, text)
import Html.Attributes exposing (attribute, class, href, placeholder, src, type_, value)
import Html.Events exposing (onClick, onInput)
import Session exposing (Session)


type alias Model =
    { session : Session
    , id : Int
    }


init : Session -> Int -> ( Model, Cmd msg )
init session id =
    ( { session = session
      , id = id
      }
    , Cmd.none
    )


toSession : Model -> Session
toSession model =
    model.session


view : Model -> { title : String, content : Html Msg }
view model =
    { title = "Contract"
    , content =
        div [ class "section" ]
            [ div [ class "container" ]
                [ div [ class "card" ]
                    [ div [ class "card-content is-clearfix" ]
                        [ div [ class "cc-heading" ]
                            [ h1 [ class "title" ]
                                [ text "Fix our website!" ]
                            , h2 [ class "subtitle" ]
                                [ text "Posted by "
                                , a [ href "/organization/1", class "subtitle has-text-link" ]
                                    [ text "My NonProfit" ]
                                ]
                            ]
                        , div [ class "content cc-content" ]
                            [ h3 [] [ text "Description" ]
                            , p [] [ text lorem ]
                            ]
                        , div [ class "is-pulled-right" ]
                            [ button [ class "button is-primary", onClick (SignUp model.id) ] [text "Sign Up"]]
                        ]
                    ]
                ]
            ]
    }


type Msg
    = Nothing
    | Something
    | SignUp Int


lorem =
    """Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed facilisis quis ex a vulputate. Suspendisse arcu ante, ultricies in quam porttitor, tempus pretium tellus. Donec id vehicula massa. Aenean id commodo est. Suspendisse potenti. Proin et nunc tellus. Phasellus vitae neque sodales, sodales elit cursus, commodo orci. Donec tristique mi ac leo posuere viverra. Mauris eu lectus sed nibh maximus imperdiet at nec dui.

Vivamus gravida dui eget dolor mattis bibendum elementum quis neque. Donec at massa arcu. Sed volutpat maximus elit in vehicula. Donec aliquet rutrum odio, et semper lorem porta pretium. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tincidunt urna tellus, eu porta magna iaculis eu. Morbi rutrum luctus lacus sit amet semper. Nunc rhoncus finibus vestibulum. Suspendisse potenti. Suspendisse potenti.

Sed ut lectus massa. Sed tempus mi at libero elementum luctus. In nisl dolor, pulvinar sit amet finibus et, tincidunt ac quam. Fusce erat mi, gravida sit amet ante non, pellentesque venenatis arcu. Interdum et malesuada fames ac ante ipsum primis in faucibus. Sed cursus in odio at dapibus. Suspendisse ut est dictum nunc congue varius ut eget mauris. Nam sit amet malesuada tellus.

Proin at massa sed enim tempus tempus. Pellentesque ut auctor diam, vitae eleifend neque. Nunc et convallis diam. Etiam id malesuada velit, non feugiat libero. Aliquam pharetra varius turpis non tincidunt. Morbi ornare vulputate mollis. Donec auctor elit ultricies, accumsan quam eget, euismod sapien. Donec auctor mauris non viverra tincidunt. Proin rhoncus congue consectetur. Aenean ac magna vitae urna pharetra convallis. Ut ac dui elit. Phasellus ullamcorper augue nisl. Cras id metus ut sem mattis convallis. Fusce efficitur cursus lobortis. Curabitur vitae lorem tristique, tempor metus non, tristique justo. Pellentesque convallis, velit a cursus dignissim, lorem urna varius augue, eget iaculis magna ipsum in nulla.

In vitae leo et ante bibendum auctor nec consequat libero. Praesent ut rutrum dui. Mauris ut leo sit amet erat faucibus malesuada sit amet hendrerit turpis. Nam sed mattis dolor. Mauris sollicitudin sollicitudin rutrum. Vivamus bibendum libero ac porta fermentum. Fusce tempus semper lacinia. In hac habitasse platea dictumst. Maecenas dolor ex, pharetra vitae metus vel, aliquam pellentesque elit."""
