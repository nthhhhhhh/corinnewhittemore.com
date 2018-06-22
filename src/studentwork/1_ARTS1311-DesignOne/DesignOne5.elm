module DesignOne5 exposing (content)

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
            , p [ class "is-6" ] [ text "Texture." ]
            ]
        ]


divTileDescription2 : Html Msg
divTileDescription2 =
    div [ class "tile is-parent is-6" ]
        [ article [ class "content" ]
            [ h2 [ class "title is-3 has-text-weight-bold" ] [ text "The Work" ]
            , p [ class "is-6" ]
                [ text """"On a heavy-weight 20 x 30 in. white illustration board
                mount 6 textures that elicit one of the following emotions:
                Serene, Anxious, Jubilant, Chaotic, Grouchy and Curious."""
                ]
            ]
        ]


divTileStudentImagesRow1 : Html Msg
divTileStudentImagesRow1 =
    let
        students =
            [ "5anxious", "5chaotic" ]
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
            [ "5curious", "5grouchy" ]
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
            [ "5jubilant", "5serene" ]
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
