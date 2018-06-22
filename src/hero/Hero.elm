module Hero exposing (section_)

import Html exposing (section, Html, text, div, h2, h5)
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
                        [ h2 [ class "title is-2" ] [ text t.title ]
                        , h5 [ class "subtittle is-5" ] [ text t.subtitle ]
                        ]
                    ]
                ]

        Nothing ->
            section [] []
