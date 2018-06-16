module ItalyJournals exposing (content)

import Dict
import Maybe exposing (withDefault)
import Html exposing (section, Html, div)
import Html.Attributes exposing (class, style, id)
import ImageUtil exposing (ImagePath, divTileImgGenerator)
import Messages exposing (Msg(ImageClick))


content : Html Msg
content =
    div [] [ sectionItalyJournals ]


imagePathFromTitle : Dict.Dict String String
imagePathFromTitle =
    let
        root =
            "./images/artwork/italyJournals/"

        mkPair =
            -- make pair with title string and file string
            \key -> ( key, root ++ key ++ ".jpg" )
    in
        Dict.fromList <|
            List.map
                mkPair
                [ "week2-75", "week2.5", "week02", "week03-25", "week03" ]



-- resolution for all images


bulmaResolution : String
bulmaResolution =
    "is-800x1000"


divTileImgWeek2_75 : Html Msg
divTileImgWeek2_75 =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "week2-75" imagePathFromTitle))
        "week2-75"
        bulmaResolution
        (ImageClick 0)


divTileImgWeek2_5 : Html Msg
divTileImgWeek2_5 =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "week2.5" imagePathFromTitle))
        "week2.5"
        bulmaResolution
        (ImageClick 1)


divTileImgWeek02 : Html Msg
divTileImgWeek02 =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "week02" imagePathFromTitle))
        "week02"
        bulmaResolution
        (ImageClick 2)


divTileImgWeek03_25 : Html Msg
divTileImgWeek03_25 =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "week03-25" imagePathFromTitle))
        "week03-25"
        bulmaResolution
        (ImageClick 3)


divTileImgWeek03 : Html Msg
divTileImgWeek03 =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "week03" imagePathFromTitle))
        "week03"
        bulmaResolution
        (ImageClick 4)


divLeftTileTop : Html Msg
divLeftTileTop =
    div [ class "tile" ]
        [ divTileImgWeek02, divTileImgWeek2_5 ]


divLeftTileBottom : Html Msg
divLeftTileBottom =
    div [ class "tile" ]
        [ divTileImgWeek2_75, divTileImgWeek03 ]


divLeftTile : Html Msg
divLeftTile =
    div [ class "tile is-parent is-vertical" ]
        [ divLeftTileTop
        , divLeftTileBottom
        ]


divRightTile : Html Msg
divRightTile =
    div [ class "tile is-parent is-vertical" ] [ divTileImgWeek03_25 ]


divTileItalyJournals : Html Msg
divTileItalyJournals =
    div [ class "tile is-ancestor" ] [ divLeftTile, divRightTile ]


sectionItalyJournals : Html Msg
sectionItalyJournals =
    section
        [ class "section"
        , style [ ( "zoom", "0.8" ), ( "-moz-transform", "scale(0.8)" ) ]
        ]
        [ div [ class "container" ] [ divTileItalyJournals ]
        ]
