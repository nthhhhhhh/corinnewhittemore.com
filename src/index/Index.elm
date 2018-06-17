module Index exposing (..)

import Hero exposing (section_)
import Home exposing (content)
import Html exposing (div, Html, text)
import Html.Attributes exposing (class)
import Model exposing (Model, init)
import Messages exposing (Msg(..))
import NavBar exposing (navBar)
import Update exposing (update)


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- view ------------------------------------------------------------------------


view : Model -> Html Msg
view model =
    div [ class "main-container" ]
        [ navBar
            model.isBurgerActive
            Burger
            "./images/design/ecmw_black.png"
        , Hero.section_ <| model.heroTitle
        , model.content
        ]



-- subscriptions ---------------------------------------------------------------


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
