module Home exposing (content)

import Html exposing (Attribute, article, section, figure, Html, text, img, div, p)
import Html.Attributes exposing (class, style, src)
import MainCopy exposing (bioCopy)


content : Html msg
content =
    div [ class "container" ]
        [ sectionMainContent ]


attributeAlignCenter : Attribute msg
attributeAlignCenter =
    style [ ( "align-content", "center" ) ]



-- biography copy:


divContent : Html msg
divContent =
    div [ class "content is-size-7" ]
        [ p [] [ text bioCopy ] ]



-- Columns--------------------------------------------------------------
-- tile for biography copy:


attributeTextAlignJustify : Attribute msg
attributeTextAlignJustify =
    style [ ( "text-align", "justify" ) ]


divTileCopy : Html msg
divTileCopy =
    div
        [ class "tile is-parent is-6"
        , attributeAlignCenter
        , attributeTextAlignJustify
        ]
        [ article [ class "content" ]
            [ p [ class "title is-size-2 font-garamond" ]
                [ text "Corinne Whittemore" ]
            , divContent
            ]
        ]



---- images in figure ------------------


figureImageIndexImg : Html msg
figureImageIndexImg =
    figure
        [ class "image is-square" ]
        [ img [ src "./images/design/index.gif" ] [] ]


divTileImg : Html msg
divTileImg =
    div [ class "tile is-parent is-6" ]
        [ div [ class "tile is-child" ]
            [ figureImageIndexImg ]
        ]



-- tile for the three images:


divTiles : Html msg
divTiles =
    div [ class "tile is-ancestor" ] [ divTileImg, divTileCopy ]


sectionMainContent : Html msg
sectionMainContent =
    section
        [ class "section"
        , attributeAlignCenter
        ]
        [ divTiles ]
