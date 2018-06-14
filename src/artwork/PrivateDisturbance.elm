module PrivateDisturbance exposing (content)

import ArtworkCopy exposing (privateDisturbanceArtistStatement)
import Dict
import Maybe exposing (withDefault)
import Html exposing (Attribute, section, Html, text, div, p)
import Html.Attributes exposing (class, style, id)
import ImageUtil exposing (ImagePath, divTileImgGenerator)
import Messages exposing (Msg(ImageClick))


main : Html Msg
main =
    content


content : Html Msg
content =
    div [] [ sectionPrivateDisturbance ]


attributeTextAlignJustify : Attribute msg
attributeTextAlignJustify =
    style [ ( "text-align", "justify" ) ]


imagePathFromTitle : Dict.Dict String String
imagePathFromTitle =
    let
        root =
            -- "./images/artwork/privateDisturbance/"
            "../index/images/artwork/privateDisturbance/"

        mkPair =
            -- make pair with title string and file string
            \key -> ( key, root ++ key ++ ".jpg" )
    in
        -- dictionary from pair generated from mkpair
        Dict.fromList <|
            List.map
                mkPair
                [ "1_SubtlePresence"
                , "2_ShiftingPerspective"
                , "3_MindGames"
                , "4_ExcessiveForce"
                , "5_Battlefield"
                , "6_NoPrisoners"
                ]


bulmaResolution : String
bulmaResolution =
    "is-4000x571"


divTileImgSubtlePresence : Html Msg
divTileImgSubtlePresence =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "1_SubtlePresence" imagePathFromTitle))
        "Subtle Presence"
        bulmaResolution
        (ImageClick 0)


divTileImgShiftingPerspective : Html Msg
divTileImgShiftingPerspective =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "2_ShiftingPerspective" imagePathFromTitle))
        "Shifting Perspective"
        bulmaResolution
        (ImageClick 1)


divTileImgMindGames : Html Msg
divTileImgMindGames =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "3_MindGames" imagePathFromTitle))
        "Mind Games"
        bulmaResolution
        (ImageClick 2)


divTileImgExcessiveForce : Html Msg
divTileImgExcessiveForce =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "4_ExcessiveForce" imagePathFromTitle))
        "Excessive Force"
        bulmaResolution
        (ImageClick 3)


divTileImgBattleField : Html Msg
divTileImgBattleField =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "5_Battlefield" imagePathFromTitle))
        "Battle Field"
        bulmaResolution
        (ImageClick 4)


divTileImgNoPrisoners : Html Msg
divTileImgNoPrisoners =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "6_NoPrisoners" imagePathFromTitle))
        "Battle Field"
        bulmaResolution
        (ImageClick 5)


divTileBottomRight : Html Msg
divTileBottomRight =
    div [ class "tile is-parent" ]
        []


divTileWideImages : Html Msg
divTileWideImages =
    div [ class "tile is-child is-vertical", style [ ( "padding-top", "13%" ) ] ]
        [ divTileImgSubtlePresence
        , divTileImgShiftingPerspective
        , divTileImgMindGames
        , divTileImgExcessiveForce
        , divTileImgBattleField
        , divTileImgNoPrisoners
        ]


divTileIs6Right : Html Msg
divTileIs6Right =
    div [ class "tile is-vertical is-parent" ]
        [ divTileWideImages ]


divTileBottomLeft : Html Msg
divTileBottomLeft =
    div [ class "tile is-parent" ]
        []


divTileArtistStatement : Html msg
divTileArtistStatement =
    div [ class "tile is-child" ]
        [ p [ class "title font-garamond", attributeTextAlignJustify ] [ text "Artist Statement" ]
        , p [ attributeTextAlignJustify ] [ text privateDisturbanceArtistStatement ]
        ]


divTileIs6Left : Html msg
divTileIs6Left =
    div [ class "tile is-6 is-vertical is-parent" ]
        [ divTileArtistStatement ]


divTileTop : Html Msg
divTileTop =
    div [ class "tile" ] [ divTileIs6Left, divTileIs6Right ]


divTileBottom : Html Msg
divTileBottom =
    div [ class "tile" ] [ divTileBottomLeft, divTileBottomRight ]


divTilePrivateDisturbance : Html Msg
divTilePrivateDisturbance =
    div [ class "tile is-ancestor is-vertical" ] [ divTileTop, divTileBottom ]


sectionPrivateDisturbance : Html Msg
sectionPrivateDisturbance =
    section [ class "section", id "private-disturbance" ]
        [ div
            [ class "container"
            , style
                [ ( "zoom", "0.8" )
                , ( "-moz-transform-origin", "top" )
                , ( "-moz-transform", "scale(0.8)" )
                ]
            ]
            [ divTilePrivateDisturbance ]
        ]
