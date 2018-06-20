module Model exposing (Model, init)

import Navigation
import Messages exposing (Msg)
import Html exposing (Html, section)
import Home exposing (content)
import PageType exposing (PageType(..))
import Routing exposing (Route)


type alias Model =
    { isBurgerActive : Bool
    , isModalActive : Bool
    , content : Html Msg
    , pageType : PageType
    , heroTitle : Maybe { title : String, subtitle : String }
    , hero : Html Msg
    , route : Route
    }


initialModel : Route -> Model
initialModel route =
    { isBurgerActive = False
    , isModalActive = False
    , content = Home.content
    , pageType = HomePage
    , heroTitle = Nothing
    , hero = section [] []
    , route = route
    }


init : Navigation.Location -> ( Model, Cmd msg )
init location =
    ( initialModel <| Routing.parseLocation location
    , Cmd.none
    )
