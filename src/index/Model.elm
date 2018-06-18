module Model exposing (Model, init)

import Navigation
import Messages exposing (Msg)
import Html exposing (Html, section)
import Home exposing (content)
import PageType exposing (PageType(..))


type alias Model =
    { isBurgerActive : Bool
    , isModalActive : Bool
    , content : Html Msg
    , pageType : PageType
    , heroTitle : Maybe { title : String, subtitle : String }
    , hero : Html Msg
    , currentRoute : Navigation.Location
    }


init : Navigation.Location -> ( Model, Cmd msg )
init location =
    ( { isBurgerActive = False
      , isModalActive = False
      , content = Home.content
      , pageType = HomePage
      , heroTitle = Nothing
      , hero = section [] []
      , currentRoute = location
      }
    , Cmd.none
    )
