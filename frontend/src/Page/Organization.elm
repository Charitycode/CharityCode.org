module Page.Organization exposing (Model, Msg, init, toSession, view)

import Html exposing (Html, a, button, div, figure, form, h1, h2, h3, i, img, input, label, p, section, span, text)
import Html.Attributes exposing (attribute, class, href, placeholder, src, type_, value)
import Html.Events exposing (onClick, onInput)
import Session exposing (Session)
import Markdown as Markdown


toSession : Model -> Session
toSession model =
    model.session


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


view : Model -> { title : String, content : Html Msg }
view model =
    { title = "Organization"
    , content =
        div [ class "section" ]
            [ div [ class "container" ]
                [ div [ class "columns" ]
                    [ div [ class "column is-one-third" ]
                        [ div [ class "card" ]
                            [ div [ class "card-content" ]
                                [ div [ class "media" ]
                                    [ div [ class "media-left" ] 
                                        [ figure [ class  "image is-48x48x" ] 
                                            [ img [src "https://bulma.io/images/placeholders/96x96.png"] []
                                            ]
                                        ]
                                    , div [ class "media-content" ]
                                        [ p [ class "title is-4" ] [ text "Humane Society" ]
                                        , p [ class "subtitle is-6" ] [ text "#KYHumaneSociety"]
                                        , p [ class "subtitle is-6 has-text-grey" ] [ text "43 Employees"]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    , div [ class "column is-two-thirds"] 
                        [ div [ class "card" ]
                            [ div [ class "card-content" ] [ content filler ] ]
                        ]
                    ]
                ]
            ]
    }

content : String -> Html msg
content s=
   Markdown.toHtml [class "content"] s

filler = """
# About Us
The Kentucky Humane Society (KHS), located in Louisville, KY, is a private, nonprofit organization that is Kentucky's largest pet adoption agency. KHS is also the state's oldest animal welfare organization, founded in 1884.

 # Our Mission
The Kentucky Humane Society is a champion for companion animals. Through leadership, education and proactive solutions, we are creating more compassionate communities.

 
# Our Vision for the Future
KHS envisions a day when every companion animal is given the care, resources and lifelong home they deserve.
 
# Our Commitment to Pets
The Kentucky Humane Society will never euthanize a pet due to lack of space.
We are committed to saving every healthy, behaviorally sound animal we take in.
 
# Our Core Values
Core values are the fundamental beliefs that our staff live by every day. These guiding principles highlight what the Kentucky Humane Society stands for.

- Always Pawsitive: Embracing optimism at all times with animals, ourselves, each other and our community.
- Compassion Matters: Meeting everyone with an open mind, kindness and respect.
- Inspire Others: Encouraging collaboration, perseverance and dedication for our mission.
- Ever-Evolving: Leading the change our communities need.
"""

type Msg
    = Nothing
    | Something
