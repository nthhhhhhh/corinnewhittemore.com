module Modal exposing (chevronLeftStyle, chevronRightStyle)

import Html exposing (style)
import Html.Attributes exposing (Attribute)


chevronLeftStyle : Attribute msg
chevronLeftStyle =
    style
        [ ( "font-size", "32px" )
        , ( "position", "absolute" )
        , ( "top", "0" )
        , ( "bottom", "0" )
        , ( "right", "100px" )
        , ( "margin", "auto" )
        , ( "color", "#4D4D4F" )
        ]


chevronRightStyle : Attribute msg
chevronRightStyle =
    style
        [ ( "font-size", "32px" )
        , ( "position", "absolute" )
        , ( "top", "0" )
        , ( "bottom", "0" )
        , ( "left", "100px" )
        , ( "margin", "auto" )
        , ( "color", "#4D4D4F" )
        ]
