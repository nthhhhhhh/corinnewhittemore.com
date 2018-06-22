module DesignOne4 exposing (content)

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
            , p [ class "is-6" ] [ text """Primary color mixing.""" ]
            ]
        ]


divTileDescription2 : Html Msg
divTileDescription2 =
    div [ class "tile is-parent is-6" ]
        [ article [ class "content" ]
            [ h2 [ class "title is-3 has-text-weight-bold" ] [ text "Objective" ]
            , p [ class "is-6" ]
                [ text """18 x 24 in. composition using soft pastels. Use two values of yellow, two values of blue, and two values of red, and white. Black, Secondary and neutral colors are not allowed."""
                ]
            ]
        ]


divTileStudentImagesRow1 : Html Msg
divTileStudentImagesRow1 =
    let
        students =
            [ "4 1", "4 2" ]
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
            [ "4 3", "4 5" ]
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
