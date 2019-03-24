module Page.Why exposing (view, Msg)

import Browser
import Html exposing (Html, button, div, text, input, label, h1, h2, p, figure, section, img, form, a)
import Html.Attributes exposing (type_, placeholder, value, class, src, attribute, href)
import Html.Events exposing (onClick, onInput)
import Http

-- TODO: Update this view
view : { title : String, content : Html msg }
view =
  { title = "What is Charity Code?"
  , content = div [ class "hero-body content is-medium" ]
    [ div [ class "container" ]
        [ h1 [ ]
            [ text "We're helping Nonprofits find design, development, and tech help." ]
        , body "Charity Code connects Nonprofits with developers and designers all over the world. Charity Code is a free (and open source!) service. We believe that all parties -- Developers, Designers, Nonprofits -- can benefit from working together."
        , header "How does it work?"
        , body "Nonprofits sign up and post contracts (just a name, don't get scared!). Tech help (Developers, Designers, etc) sign up and can browse contracts. Then, you can reach out to the poster and express your interest. If you're a good fit for the job you'll hear back and can figure out when and how to get started!"
        , header "Contracts?"
        , body "We thought it was a better name than job-posting, but really, its just a fancy name for \"help wanted\" ads. If there's any actual contractual obligation, that's determined by the Nonprofit and the helper!"
        , header "Do I get paid?"
        , body "Maybe! It depeonds on the contract and the nonprofit! Some nonprofits are able and willing to pay for their help. Each contract has a field for compensation and you can search for contracts with compensation, if thats what you're looking for. We won't judge!"
        , header "Do you get paid?"
        , body "Nope. We don't run transactions or process payments so we cant take a cut. Right now, we're doing this just to help out. However, if you find this useful, please consider helping by contributing tech help or"
        , header "I'm a student. Can I help?"
        , body "Absolutely! A lot of Nonprofits are happy to have the help of students and academics and these opportunity can help develop some \"real world\" skills that can help develop you further."
        ]
    ]}

header: String -> Html msg
header title =
    h2 [] [text title]

body: String -> Html msg
body content =
    p [ class "is-small" ] [text content]

type Msg 
  = Nothing