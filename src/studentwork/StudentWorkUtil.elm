module StudentWorkUtil exposing (imageTiles, margins, underline, tabs)

import Html exposing (Attribute, Html, figure, div, img, hr, a)
import Html.Attributes exposing (class, style, alt, src)
import Html.Events exposing (onClick)
import ImageUtil exposing (ImagePath, HtmlAlt, BulmaDimension)
import Tabs exposing (studentwork)
import Messages exposing (Msg(..))


imageTiles :
    List HtmlAlt
    -> List ImagePath
    -> List BulmaDimension
    -> List (Html Msg)
imageTiles ts ps bds =
    List.map4 divTileImgGenerate
        ts
        ps
        bds
        (List.range 0 (List.length ps))


divTileImgGenerate : HtmlAlt -> ImagePath -> BulmaDimension -> Int -> Html Msg
divTileImgGenerate altStr path dimension imgIndex =
    div [ class "tile is-parent" ]
        [ div [ class "tile is-child" ]
            [ figure [ class ("image is-unselectable" ++ dimension) ]
                [ a [ onClick (ImageClick imgIndex) ]
                    [ img
                        [ src path
                        , alt altStr
                        ]
                        []
                    ]
                ]
            ]
        ]



-- attributes for an underline


attributeUnselectable : Attribute msg
attributeUnselectable =
    style
        [ ( "-webkit-user-select", "none" )
        , ( "-moz-user-select", "none" )
        , ( "-ms-user-select", "none" )
        , ( "-o-user-select", "none" )
        , ( "user-select", "none" )
        ]


attributeUnderline : Attribute msg
attributeUnderline =
    style
        [ ( "alig-items", "center" )
        , ( "border-bottom-color", "#dbdbdb" )
        , ( "border-bottom-style", "solid" )
        , ( "border-bottom-width", "1px" )
        , ( "display", "flex" )
        , ( "flex-grow", "1" )
        , ( "flex-shrink", "0" )
        , ( "box-sizing", "inherit" )
        , ( "margin", "0 auto" )
        , ( "width", "33%" )
        ]



-- line, preferrably used underneath tabs


underline : Html Msg
underline =
    hr [ attributeUnselectable, attributeUnderline ] []


tabs : Int -> Html Msg
tabs i =
    Tabs.studentwork 6 i "#/studentwork/design_one"



-- margins


margins : Attribute Msg
margins =
    style
        [ ( "margin-left", "15%" )
        , ( "margin-right", "15%" )
        , ( "margin-top", "1%" )
        ]
