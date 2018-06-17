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
    }


initialModel : Model
initialModel =
    { isBurgerActive = False
    , isModalActive = False
    , content = Home.content
    , pageType = Index
    }


init : ( Model, Cmd msg )
init =
    ( initialModel, Cmd.none )
