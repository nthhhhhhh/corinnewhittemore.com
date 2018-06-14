module ValleyCultura exposing (main)

import ArtworkCopy
    exposing
        ( valleyCulturaArtistStatement
        , valleyCulturaMaterialsProcess
        )
import Dict
import Maybe exposing (withDefault)
import Html exposing (Attribute, section, article, figure, text, Html, div, img, a, p)
import Html.Attributes exposing (class, style, alt, src, id)
import Html.Events exposing (onClick)
import ImageUtil exposing (ImagePath, divTileImgGenerator)
import Messages exposing (Msg(ImageClick))


main : Html Msg
main =
    div [] [ content ]


attributeTextAlign : Attribute msg
attributeTextAlign =
    style [ ( "text-align", "justify" ) ]


imagePathFromTitle : Dict.Dict String String
imagePathFromTitle =
    let
        root =
            -- "./images/artwork/ValleyCultura/"
            "../index/images/artwork/ValleyCultura/"

        mkPair =
            -- make pair with title string and file string
            \key -> ( key, root ++ key ++ ".jpg" )
    in
        Dict.fromList <|
            List.map
                mkPair
                [ "square", "wide", "threeTwo" ]


divTileImgSquare : Html Msg
divTileImgSquare =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "square" imagePathFromTitle))
        "square"
        "is-square"
        (ImageClick 0)



-- need to make the top left tile equal to the left one
-- you found out that the image fills the tile...good luck future roseph.


divTileImgNextToArtistStatement : Html Msg
divTileImgNextToArtistStatement =
    div [ class "tile is-child", style [ ( "padding-top", "16%" ) ] ]
        [ a [ onClick <| ImageClick 0 ]
            [ figure
                [ class <| "image is-unselectable is-3by2" ]
                [ img
                    [ src (Maybe.withDefault "" (Dict.get "threeTwo" imagePathFromTitle))
                    , alt "threeTwo"
                    ]
                    []
                ]
            ]
        ]


divTileImgWider : Html Msg
divTileImgWider =
    divTileImgGenerator
        (Maybe.withDefault "" (Dict.get "wide" imagePathFromTitle))
        "wide"
        "is-847x300"
        (ImageClick 1)


divTileArtistStatement : Html msg
divTileArtistStatement =
    div
        [ class "tile is-child is-vertical" ]
        [ div [ class "title font-garamond is-size-1" ] [ text "Artist Statement" ]
        , article [ class "content is-size-6" ]
            [ p [ attributeTextAlign ] [ text valleyCulturaArtistStatement ] ]
        ]


divTileMaterialsAndProcess : Html msg
divTileMaterialsAndProcess =
    div [ class "tile is-parent" ]
        [ div [ class "tile is-child is-vertical" ]
            [ p [ class "title font-garamond" ] [ text "Materials &\nProcess" ]
            , article [ class "content", attributeTextAlign ]
                [ p [] [ text valleyCulturaMaterialsProcess ] ]
            ]
        ]


divAncestor : Html Msg
divAncestor =
    div [ class "tile is-ancestor is-vertical", style [ ( "flex-wrap", "wrap" ) ] ]
        [ div [ class "tile", style [ ( "flex-wrap", "wrap" ) ] ]
            [ div [ class "tile is-parent" ] [ divTileArtistStatement ]
            , div [ class "tile is-parent" ] [ divTileImgNextToArtistStatement ]
            ]
        , div [ class "tile" ]
            [ div [ class "tile is-vertical" ]
                [ div [ class "tile is-parent" ] [ divTileImgWider ]
                , div [ class "tile is-parent" ] [ divTileImgWider ]
                , div [ class "tile is-parent" ] [ divTileImgWider ]
                ]
            , div [ class "tile " ] [ divTileMaterialsAndProcess ]
            ]
        , div [ class "tile " ]
            [ div [ class "tile" ] [ div [ class "tile is-parent" ] [ divTileImgWider ] ]
            , div [ class "tile" ]
                [ div [ class "tile is-parent" ] [ divTileImgSquare ]
                , div [ class "tile is-parent" ] [ divTileImgSquare ]
                ]
            ]
        ]


content : Html Msg
content =
    section
        [ class "section"
        , style
            [ ( "zoom", "0.8" )
            , ( "-moz-transform-origin", "top" )
            , ( "-moz-transform", "scale(0.8)" )
            ]
        ]
        [ div [ class "container" ] [ divAncestor ] ]
