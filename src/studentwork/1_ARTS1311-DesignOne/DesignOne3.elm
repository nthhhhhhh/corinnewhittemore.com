module DesignOne3 exposing (content)

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
            [ p [ class "title is-3 has-text-weight-bold" ] [ text "The Project" ]
            , p [ class "is-6" ] [ text """Point Line Plane Photo Isolation.""" ]
            ]
        ]


divTileDescription2 : Html Msg
divTileDescription2 =
    div [ class "tile is-parent is-6" ]
        [ article [ class "content" ]
            [ h2 [ class "title is-3 has-text-weight-bold" ]
                [ text "The Elements" ]
            , p [ class "is-6" ]
                [ text """6 x 6 in. black and white process book abstracting a gray-scale photograph through point, line and plane."""
                ]
            ]
        ]


divTileStudentImagesRow1 : Html Msg
divTileStudentImagesRow1 =
    let
        students =
            [ "3 1-1", "3 4-4", "3 6-1" ]
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
            [ "3 12-3", "3 14-3", "3 16" ]
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
