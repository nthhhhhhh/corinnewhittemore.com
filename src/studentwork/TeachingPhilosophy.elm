module TeachingPhilosophy exposing (content)

import Html exposing (Html, div, text, li, a)
import Html.Attributes exposing (href)
import Messages exposing (Msg)


content =
    div []
        [ text "TeachingPhilosophy"
        , li []
            [ a [ href "" ] [ text "Design 1" ]
            , a [ href "#/studentwork/design_one/1" ]
                [ text "Digital Media" ]
            , a [ href "" ] [ text "Typography" ]
            , a [ href "" ] [ text "Graphic Design 1" ]
            , a [ href "" ] [ text "Independent Study" ]
            ]
        ]
