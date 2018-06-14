module Model exposing (Model, init)

type alias Model = 
    { isBurgerActive : Bool
    , isModalActive  : Bool
    }

initialModel : Model
initialModel =
    { isBurgerActive = False
    , isModalActive  = False
    }

init : (Model, Cmd msg)
init =
    (initialModel, Cmd.none)
