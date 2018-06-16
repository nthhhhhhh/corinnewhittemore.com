module ImportantPapers exposing (content)

import Dict
import Maybe exposing (withDefault)
import Html exposing (Attribute, section, Html, text, div, p)
import Html.Attributes exposing (class, style, id)
import ImageUtil exposing (ImagePath, divTileImgGenerator)
import Messages exposing (Msg(ImageClick))


content : Html Msg
content =
    div [] [ sectionImportantPapers ]


imagePathFromTitle : Dict.Dict String String
imagePathFromTitle =
    let
        root =
            -- "./images/artwork/importantPapers/"
            "../index/images/artwork/importantPapers/"

        mkPair =
            -- make pair with title string and file string
            \key -> ( key, root ++ key ++ ".jpg" )
    in
        -- dictionary from pair generated from mkpair
        Dict.fromList <|
            List.map
                mkPair
                [ "certified" ]


bulmaResolution : String
bulmaResolution =
    "is-1024x563"


divTileMainImg : Html Msg
divTileMainImg =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "certified" imagePathFromTitle))
        "Certified"
        bulmaResolution
        (ImageClick 0)


sectionImportantPapers : Html Msg
sectionImportantPapers =
    section [ class "section", id "important-papers" ]
        [ div [ class "container" ] [ divTileMainImg ] ]
