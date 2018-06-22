module DesignOne1 exposing (content)

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
            , p [ class "is-6" ]
                [ text """Use four squares to create black and white compositions that express the meaning of one of the following words: Order, Increase, Bold, Congested, Tension or Playful.""" ]
            ]
        ]


divTileDescription2 : Html Msg
divTileDescription2 =
    div [ class "tile is-parent is-6" ]
        [ article [ class "content" ]
            [ h2 [ class "title is-3 has-text-weight-bold" ] [ text "Objective" ]
            , p [ class "is-6" ]
                [ text """To develop an awareness of the formal
            elements of composition, a working knowledge of their fundamental
            principles and sensitivity towards the interrelationship between
            form and content. Students will familiarize themselves with the
            basic vocabulary necessary to verbalize their creative process and
            critical thinking."""
                ]
            ]
        ]


divTileStudentImagesRow1 : Html Msg
divTileStudentImagesRow1 =
    let
        students =
            [ "1cindy", "1dlm" ]
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
            [ "1jj", "1js" ]
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
