module Messages exposing (Msg(..))

import Keyboard


type Msg
    = CloseModal
    | Next
    | Prev
    | KeyMsg Keyboard.KeyCode
    | Burger
    | ImageClick Int
