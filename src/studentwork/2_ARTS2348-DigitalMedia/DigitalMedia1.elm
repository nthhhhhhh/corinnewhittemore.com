module DigitalMedia1 exposing (content)

import HtmlUtils exposing (AltString)
import Html exposing (Html, article, section, text, div, h2, p)
import Html.Attributes exposing (class, style)
import ImageDirectory exposing (digitalMediaImages, paths, resolutions, titles)
import Messages exposing (Msg)
import StudentWorkUtil
    exposing
        ( imageTiles
        , margins
        , tabs
        , underline
        )


divTileStudentImagesRow1 : Html Msg
divTileStudentImagesRow1 =
    let
        students =
            [ "1alyssa", "1ever", "1karely", "1lauren" ]
    in
        div [ class "tile" ] <|
            imageTiles
                (titles digitalMediaImages students)
                (paths digitalMediaImages students)
                (resolutions digitalMediaImages students)


divTileStudentImagesRow2 : Html Msg
divTileStudentImagesRow2 =
    let
        students =
            [ "1lisa", "1salma", "1stephanie", "1valerie" ]
    in
        div [ class "tile" ] <|
            imageTiles
                (titles digitalMediaImages students)
                (paths digitalMediaImages students)
                (resolutions digitalMediaImages students)


divTileDescription : Html Msg
divTileDescription =
    div [ class "tile is-parent is-6 is-vertical" ]
        [ article [ class "content" ]
            [ p [ class "title is-3 has-text-weight-bold" ] [ text "The Project" ]
            , p [ class "is-6" ] [ text """Create an animated gif that represents you, either
        literally, in character or personality.""" ]
            ]
        , article [ class "content" ]
            [ h2 [ class "title is-3 has-text-weight-bold" ] [ text "Objective" ]
            , p [ class "is-6" ] [ text "Define digital media and begin building a vocabulary of terminology." ]
            ]
        ]


divTileStudentImages : Html Msg
divTileStudentImages =
    div [ class "tile is-parent is-vertical" ]
        [ divTileStudentImagesRow1
        , divTileStudentImagesRow2
        ]


divTileIsAncestor : Html Msg
divTileIsAncestor =
    div [ class "tile is-ancestor is-vertical", style [ ( "padding-top", "3%" ) ] ]
        [ div [ class "tile is-parent" ]
            [ divTileDescription
            , divTileStudentImages
            ]
        ]


content : Int -> Html Msg
content i =
    section
        []
        [ tabs i
        , underline
        , section [ margins ] [ divTileIsAncestor ]
        ]
