module Index exposing (..)

import Html exposing (Html, text, div, a)
import Html.Attributes exposing (class, href)
import Model exposing (Model, init)
import Messages exposing (Msg(..))
import Navigation
import NavBar exposing (navBar)
import Update exposing (update)


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- view ------------------------------------------------------------------------


view : Model -> Html Msg
view model =
    div [ class "main-container" ]
        [ navBar model.isBurgerActive "./images/design/ecmw_black.png"
        , model.hero
        , model.content
        ]



-- subscriptions ---------------------------------------------------------------


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
