module Model exposing (Model, init)

import Messages exposing (Msg)
import Html exposing (Html)
import Home exposing (content)
import PageType exposing (PageType(..))


type alias Model =
    { isBurgerActive : Bool
    , isModalActive : Bool
    , content : Html Msg
    , pageType : PageType
    , heroTitle : Maybe { title : String, subtitle : String }
    }


initialModel : Model
initialModel =
    { isBurgerActive = False
    , isModalActive = False
    , content = Home.content
    , pageType = HomePage
    , heroTitle = Nothing
    }


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )
