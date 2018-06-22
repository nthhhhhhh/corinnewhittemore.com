module NavBar exposing (navBar)

import Html exposing (Attribute, Html, text, span, div, img, nav, li, ul, a)
import Html.Attributes
    exposing
        ( attribute
        , class
        , height
        , href
        , style
        , alt
        , src
        , id
        )
import Html.Events exposing (onClick)
import ImageUtil exposing (ImagePath)
import Messages exposing (Msg(..))


styleFontSize : Attribute msg
styleFontSize =
    style [ ( "font-size", "13px" ) ]


stylePaddingRight : Attribute msg
stylePaddingRight =
    style [ ( "padding-right", "10px" ) ]


imgLogo : String -> Html Msg
imgLogo path =
    img
        [ src path, alt "ecmw", height 28 ]
        []


aNavbarItem : String -> Html Msg
aNavbarItem path =
    a
        [ class "navbar-item hvr-sink"
        , style [ ( "background-color", "white" ) ]
        , href "#/home"
        ]
        [ imgLogo path ]


divNavbarBurger : Bool -> Html Msg
divNavbarBurger status =
    div
        [ class <| isBurgerActiveCrossStr status
        , attribute "data-target" "navMenubd"
        , onClick Burger
        ]
        [ span [] []
        , span [] []
        , span [] []
        ]


divNavbarBrand : Bool -> String -> Html Msg
divNavbarBrand status path =
    div [ class "navbar-brand" ] [ aNavbarItem path, divNavbarBurger status ]


navBreadcrumb : Html Msg
navBreadcrumb =
    nav
        [ class "breadcrumb"
        , styleFontSize
        , stylePaddingRight
        , attribute "aira-label" "breadcrumbs"
        ]
        [ ul []
            [ li []
                [ a
                    [ href "#/artwork/valley_cultura"
                    ]
                    [ text "Artwork" ]
                ]
            , li []
                [ a
                    [ href "#/design"
                    ]
                    [ text "Design" ]
                ]
            , li []
                [ a
                    [ href "#/studentwork/teaching_philosophy/1"
                    ]
                    [ text "Student Work" ]
                ]
            ]
        ]


divNavbarEnd : Html Msg
divNavbarEnd =
    div [ class "navbar-end" ]
        [ navBreadcrumb ]


divNavbarMenu : Bool -> Html Msg
divNavbarMenu status =
    div [ id "navMenubd", class <| isBurgerActiveMenuStr status ]
        [ divNavbarEnd ]


divnavBarMenuSmall : Bool -> Html Msg
divnavBarMenuSmall status =
    div [ id "navMenubd", class <| isBurgerActiveMenuStr status ] [ div [] [] ]


navBar : Bool -> ImagePath -> Html Msg
navBar status path =
    nav [ class "navbar" ]
        [ divNavbarBrand
            status
            path
        , divNavbarMenu status
        ]


isBurgerActiveCrossStr : Bool -> String
isBurgerActiveCrossStr active =
    if active then
        "navbar-burger burger is-active"
    else
        "navbar-burger burger"


isBurgerActiveMenuStr : Bool -> String
isBurgerActiveMenuStr active =
    if active then
        "navbar-menu is-active"
    else
        "navbar-menu"
