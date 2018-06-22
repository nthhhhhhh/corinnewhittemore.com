module DesignOne6 exposing (content)

import HtmlUtils exposing (AltString)
import Html exposing (Html, article, section, text, div, h2, p)
import Html.Attributes exposing (class, style)
import ImageDirectory exposing (designOneImages, paths, resolutions, titles)
import Messages exposing (Msg)
import StudentWorkUtil
    exposing
        ( imageTiles
        , margins
        , tabs
        , underline
        , zoom
        )


divTileDescription : Html Msg
divTileDescription =
    div [ class "tile is-parent is-6" ]
        [ article [ class "content" ]
            [ p [ class "title is-3 has-text-weight-bold" ] [ text "The Subject" ]
            , p [ class "is-6" ] [ text """Self-Portrait Mixed-Media Collage""" ]
            ]
        ]


divTileDescription2 : Html Msg
divTileDescription2 =
    div [ class "tile is-parent is-6" ]
        [ article [ class "content" ]
            [ h2 [ class "title is-3 has-text-weight-bold" ] [ text "The Work" ]
            , p [ class "is-6" ]
                [ text """"20 x 30 in. mixed-media collage using traditional and non-traditional materials/found things such as magazines, construction paper, newspaper, cloth, wrapping paper, styrofoam, aluminum foil, plastic, paper towels, yarn, etc… to create a self-portrait."""
                ]
            ]
        ]


divTileStudentImagesRow1 : Html Msg
divTileStudentImagesRow1 =
    let
        students =
            [ "6 3", "6 4" ]
    in
        div [ class "tile" ] <|
            imageTiles
                (titles designOneImages students)
                (paths designOneImages students)
                (resolutions designOneImages students)


divTileStudentImagesRow2 : Html Msg
divTileStudentImagesRow2 =
    let
        students =
            [ "6 1", "6 5" ]
    in
        div [ class "tile" ] <|
            imageTiles
                (titles designOneImages students)
                (paths designOneImages students)
                (resolutions designOneImages students)


divTileStudentImagesRow3 : Html Msg
divTileStudentImagesRow3 =
    let
        students =
            [ "6 8", "6 7" ]
    in
        div [ class "tile" ] <|
            imageTiles
                (titles designOneImages students)
                (paths designOneImages students)
                (resolutions designOneImages students)


divTileStudentImagesRow4 : Html Msg
divTileStudentImagesRow4 =
    let
        students =
            [ "6 6", "6 9" ]
    in
        div [ class "tile" ] <|
            imageTiles
                (titles designOneImages students)
                (paths designOneImages students)
                (resolutions designOneImages students)


divTileStudentImages : Html Msg
divTileStudentImages =
    div [ class "tile is-parent is-vertical" ]
        [ divTileStudentImagesRow1
        , divTileStudentImagesRow2
        , divTileStudentImagesRow3
        , divTileStudentImagesRow4
        ]


divTileIsAncestor : Html Msg
divTileIsAncestor =
    div [ class "tile is-ancestor is-vertical", style [ ( "padding-top", "3%" ) ] ]
        [ div [ class "tile is-parent" ]
            [ divTileDescription
            , divTileDescription2
            ]
        , divTileStudentImages
        ]


content : Int -> Html Msg
content i =
    section
        []
        [ tabs i
        , underline
        , section [ margins, zoom ] [ divTileIsAncestor ]
        ]
