module Tabs exposing (artwork, studentwork)

import Html exposing (Attribute, text, Html, div, nav, ul, li, a)
import Html.Attributes exposing (attribute, class, style, href)
import HtmlUtils exposing (HrefAddress, HrefText)
import Messages exposing (Msg)
import String.Extra exposing (fromInt)


type alias NumberOfTabs =
    Int


type alias Index =
    Int


type alias HighlightedTab =
    Int


type alias Hash =
    String


liTabStudentWork : Bool -> NumberOfTabs -> Hash -> Index -> Html Msg
liTabStudentWork tabIsActive t h i =
    if tabIsActive then
        li []
            [ a
                [ attribute "aria-current" "page"
                , attribute "aria-label" ("Goto project " ++ fromInt i)
                , class "pagination-link is-current "
                , href (h ++ "/" ++ fromInt i)
                ]
                [ text (fromInt i) ]
            ]
    else
        li []
            [ a
                [ attribute "aria-label" ("Goto project" ++ fromInt i)
                , class "pagination-link"
                , href (h ++ "/" ++ fromInt i)
                ]
                [ text (fromInt i) ]
            ]


attributePaddingBottom : Attribute msg
attributePaddingBottom =
    style [ ( "padding-bottom", "4%" ) ]


studentwork : NumberOfTabs -> HighlightedTab -> Hash -> Html Msg
studentwork nt ht hsh =
    div [ attributePaddingBottom ]
        [ nav
            [ attribute "aria-label" "pagination"
            , attribute "role" "navigation"
            , class "pagination is-rounded is-small"
            ]
            [ ul
                [ class "pagination-list"
                , style [ ( "justify-content", "center" ) ]
                ]
                (List.map
                    (\i ->
                        liTabStudentWork (i == ht) nt hsh i
                    )
                    (List.range 1 nt)
                )
            ]
        ]



-- HOLE:


artwork : Html Msg
artwork =
    div [] []
