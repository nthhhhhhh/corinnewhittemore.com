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


styleFontSize : Attribute msg
styleFontSize =
    style [ ( "font-size", "13px" ) ]


stylePaddingRight : Attribute msg
stylePaddingRight =
    style [ ( "padding-right", "10px" ) ]


imgLogo : String -> Html msg
imgLogo path =
    img
        [ src path, alt "ecmw", height 28 ]
        []


aNavbarItem : String -> Html msg
aNavbarItem path =
    a
        [ class "navbar-item hvr-sink"
        , style [ ( "background-color", "white" ) ]
        , href "../home/home.html"
        ]
        [ imgLogo path ]


divNavbarBurger : Bool -> msg -> Html msg
divNavbarBurger status msg =
    div
        [ class <| isBurgerActiveCrossStr status
        , attribute "data-target" "navMenubd"
        , onClick msg
        ]
        [ span [] []
        , span [] []
        , span [] []
        ]


divNavbarBrand : Bool -> msg -> String -> Html msg
divNavbarBrand status msg path =
    div [ class "navbar-brand" ] [ aNavbarItem path, divNavbarBurger status msg ]


navBreadcrumb : Html msg
navBreadcrumb =
    nav
        [ class "breadcrumb"
        , styleFontSize
        , stylePaddingRight
        , attribute "aira-label" "breadcrumbs"
        ]
        [ ul []
            [ li []
                [ a [ href "../artwork/artwork.html" ]
                    [ text "Artwork" ]
                ]
            , li []
                [ a [ href "../design/design.html" ]
                    [ text "Design" ]
                ]
            , li []
                [ a [ href "../studentWork/studentwork.html" ]
                    [ text "Student Work" ]
                ]
            , li [] [ a [ href "#" ] [ text "Contact" ] ]
            ]
        ]


divNavbarEnd : Html msg
divNavbarEnd =
    div [ class "navbar-end" ]
        [ navBreadcrumb ]


divNavbarMenu : Bool -> Html msg
divNavbarMenu status =
    div [ id "navMenubd", class <| isBurgerActiveMenuStr status ] [ divNavbarEnd ]


divnavBarMenuSmall : Bool -> Html msg
divnavBarMenuSmall status =
    div [ id "navMenubd", class <| isBurgerActiveMenuStr status ] [ div [] [] ]


navBar : Bool -> msg -> ImagePath -> Html msg
navBar status msg path =
    nav [ class "navbar" ]
        [ divNavbarBrand
            status
            msg
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
