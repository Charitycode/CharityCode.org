module Page.Privacy exposing (Msg, view)

import Html exposing (Html, a, div, footer, h1, h2, h3, li, p, text, ul)
import Html.Attributes exposing (attribute, class, href, target, title)


view : { title : String, content : Html msg }
view =
    { title = "Privacy"
    , content =
        div [ class "hero-body content is-medium" ]
            [ h1 []
                [ text "Welcome to our Privacy Policy" ]
            , h3 []
                [ text "Your privacy is critically important to us." ]
            , p []
                [ text "It is Charity Code's policy to respect your privacy regarding any information we may collect while operating our website. This Privacy Policy applies to "
                , a [ href "https://www.charitycode.org" ]
                    [ text "https://www.charitycode.org" ]
                , text "(hereinafter, \"us\", \"we\", or \"https://www.charitycode.org\"). We respect your privacy and are committed to protecting personally identifiable information you may provide us through the Website. We have adopted this privacy policy (\"Privacy Policy\") to explain what information may be collected on our Website, how we use this information, and under what circumstances we may disclose the information to third parties. This Privacy Policy applies only to information we collect through the Website and does not apply to our collection of information from other sources."
                ]
            , p []
                [ text "This Privacy Policy, together with the Terms and conditions posted on our Website, set forth the general rules and policies governing your use of our Website. Depending on your activities when visiting our Website, you may be required to agree to additional terms and conditions." ]
            , h2 []
                [ text "Website Visitors" ]
            , p []
                [ text "Like most website operators, Charity Code collects non-personally-identifying information of the sort that web browsers and servers typically make available, such as the browser type, language preference, referring site, and the date and time of each visitor request. Charity Code's purpose in collecting non-personally identifying information is to better understand how Charity Code's visitors use its website. From time to time, Charity Code may release non-personally-identifying information in the aggregate, e.g., by publishing a report on trends in the usage of its website." ]
            , p []
                [ text "Charity Code also collects potentially personally-identifying information like Internet Protocol (IP) addresses for logged in users and for users leaving comments on https://www.charitycode.org blog posts. Charity Code only discloses logged in user and commenter IP addresses under the same circumstances that it uses and discloses personally-identifying information as described below." ]
            , h2 []
                [ text "Gathering of Personally-Identifying Information" ]
            , p []
                [ text "Certain visitors to Charity Code's websites choose to interact with Charity Code in ways that require Charity Code to gather personally-identifying information. The amount and type of information that Charity Code gathers depends on the nature of the interaction. For example, we ask visitors who sign up for a blog at https://www.charitycode.org to provide a username and email address." ]
            , h2 []
                [ text "Security" ]
            , p []
                [ text "The security of your Personal Information is important to us, but remember that no method of transmission over the Internet, or method of electronic storage is 100% secure. While we strive to use commercially acceptable means to protect your Personal Information, we cannot guarantee its absolute security." ]
            , h2 []
                [ text "Advertisements" ]
            , p []
                [ text "Ads appearing on our website may be delivered to users by advertising partners, who may set cookies. These cookies allow the ad server to recognize your computer each time they send you an online advertisement to compile information about you or others who use your computer. This information allows ad networks to, among other things, deliver targeted advertisements that they believe will be of most interest to you. This Privacy Policy covers the use of cookies by Charity Code and does not cover the use of cookies by any advertisers." ]
            , h2 []
                [ text "Links To External Sites" ]
            , p []
                [ text "Our Service may contain links to external sites that are not operated by us. If you click on a third party link, you will be directed to that third party's site. We strongly advise you to review the Privacy Policy and terms and conditions of every site you visit." ]
            , p []
                [ text "We have no control over, and assume no responsibility for the content, privacy policies or practices of any third party sites, products or services." ]
            , h2 []
                [ text "Https://www.charitycode.org uses Google AdWords for remarketing" ]
            , p []
                [ text "Https://www.charitycode.org uses the remarketing services to advertise on third party websites (including Google) to previous visitors to our site. It could mean that we advertise to previous visitors who haven't completed a task on our site, for example using the contact form to make an enquiry. This could be in the form of an advertisement on the Google search results page, or a site in the Google Display Network. Third-party vendors, including Google, use cookies to serve ads based on someone's past visits. Of course, any data collected will be used in accordance with our own privacy policy and Google's privacy policy." ]
            , p []
                [ text "You can set preferences for how Google advertises to you using the Google Ad Preferences page, and if you want to you can opt out of interest-based advertising entirely by cookie settings or permanently using a browser plugin." ]
            , h2 []
                [ text "Aggregated Statistics" ]
            , p []
                [ text "Charity Code may collect statistics about the behavior of visitors to its website. Charity Code may display this information publicly or provide it to others. However, Charity Code does not disclose your personally-identifying information." ]
            , h2 []
                [ text "Cookies" ]
            , p []
                [ text "To enrich and perfect your online experience, Charity Code uses \"Cookies\", similar technologies and services provided by others to display personalized content, appropriate advertising and store your preferences on your computer." ]
            , p []
                [ text "A cookie is a string of information that a website stores on a visitor's computer, and that the visitor's browser provides to the website each time the visitor returns. Charity Code uses cookies to help Charity Code identify and track visitors, their usage of https://www.charitycode.org, and their website access preferences. Charity Code visitors who do not wish to have cookies placed on their computers should set their browsers to refuse cookies before using Charity Code's websites, with the drawback that certain features of Charity Code's websites may not function properly without the aid of cookies." ]
            , p []
                [ text "By continuing to navigate our website without changing your cookie settings, you hereby acknowledge and agree to Charity Code's use of cookies." ]
            , h2 []
                [ text "Privacy Policy Changes" ]
            , p []
                [ text "Although most changes are likely to be minor, Charity Code may change its Privacy Policy from time to time, and in Charity Code's sole discretion. Charity Code encourages visitors to frequently check this page for any changes to its Privacy Policy. Your continued use of this site after any change in this Privacy Policy will constitute your acceptance of such change." ]
            , h2 []
                [ text "Credit & Contact Information" ]
            , p []
                [ text "This privacy policy was created at "
                , a [ href "https://termsandconditionstemplate.com/privacy-policy-generator/", attribute "style" "color:inherit;text-decoration:none;", target "_blank", title "Privacy policy template generator" ]
                    [ text "termsandconditionstemplate.com" ]
                , text ". If you have any questions about this Privacy Policy, please contact us via "
                , a [ href "mailto:support@charitycode.org" ]
                    [ text "email" ]
                ]
            ]
    }


type Msg
    = Nothing
