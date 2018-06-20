module Hero exposing (section_)

import Html exposing (section, Html, text, div, h3, h6)
import Html.Attributes exposing (class, id)
import Messages exposing (Msg)


section_ : Maybe { title : String, subtitle : String } -> Html Msg
section_ ts =
    case ts of
        Just t ->
            section [ class "hero" ]
                [ div [ class "hero-body" ]
                    [ div
                        [ class
                            "container has-text-centered font-garamond"
                        ]
                        [ h3 [ class "title is-3" ] [ text t.title ]
                        , h6 [ class "subtittle is-6" ] [ text t.subtitle ]
                        ]
                    ]
                ]

        Nothing ->
            section [] []
