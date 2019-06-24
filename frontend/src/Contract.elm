module Contract exposing (Contract, contractDecoder, contractsDecoder)

import Json.Decode exposing (Decoder, field, string, list, map5)


type alias Contract =
    { title : String
    , description : String
    , contractType : String
    , compensation : String
    , postDate : String 
    }

contractsDecoder : Decoder (List Contract)
contractsDecoder =
    list contractDecoder

contractDecoder : Decoder Contract
contractDecoder =
    map5 Contract
        titleDecoder
        descriptionDecoder
        contractTypeDecoder
        compensationDecoder
        postDateDecoder

titleDecoder : Decoder String
titleDecoder =
    field "title" string

descriptionDecoder : Decoder String
descriptionDecoder =
    field "description" string

contractTypeDecoder : Decoder String
contractTypeDecoder =
    field "contractType" string

compensationDecoder : Decoder String
compensationDecoder =
    field "compensation" string

postDateDecoder : Decoder String
postDateDecoder =
    field "postDate" string