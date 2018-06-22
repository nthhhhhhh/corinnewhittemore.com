module DesignOne2 exposing (content)

import HtmlUtils exposing (AltString)
import Html exposing (Html, article, section, text, div, h2, p)
import Html.Attributes exposing (class, style)
import ImageDirectory exposing (designOneImages, paths, resolutions, titles)
import Messages exposing (Msg)
import StudentWorkUtil exposing (imageTiles, margins, tabs, underline)


divTileDescription : Html Msg
divTileDescription =
    div [ class "tile is-parent is-6" ]
        [ article [ class "content" ]
            [ p [ class "title is-3 has-text-weight-bold" ] [ text "The Project" ]
            , p [ class "is-6" ] [ text """Compose four 6x6 inch black and
            white images using the initials of your name.""" ]
            ]
        ]


divTileDescription2 : Html Msg
divTileDescription2 =
    div [ class "tile is-parent is-6" ]
        [ article [ class "content" ]
            [ h2 [ class "title is-3 has-text-weight-bold" ]
                [ text "The Elements" ]
            , p [ class "is-6" ]
                [ text """Plate 1: Asymmetrical with 5 values of grays (can include black and white). Plate 2: Symmetrical/Radial composition or Disrupted Symmetry. Plate 3: Asymmetrical with area of emphasis (contrast, isolation, placement). Plate 4: Crystallographic Balance (all over pattern)"""
                ]
            ]
        ]


divTileStudentImagesRow1 : Html Msg
divTileStudentImagesRow1 =
    let
        students =
            [ "2ar", "2dlm", "2jar" ]
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
            [ "2jv", "2ks", "2lpm" ]
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
        [ style
            [ ( "margin-left", "15%" )
            , ( "margin-right", "15%" )
            , ( "margin-top", "1%" )
            ]
        ]
        [ tabs i
        , underline
        , divTileIsAncestor
        ]
