module Messages exposing (Msg(..))

import Keyboard
import Navigation


type Msg
    = CloseModal
    | Next
    | Prev
    | KeyMsg Keyboard.KeyCode
    | Burger
    | ImageClick Int
    | UrlChange Navigation.Location
