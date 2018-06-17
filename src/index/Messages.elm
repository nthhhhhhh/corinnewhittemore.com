module Messages exposing (Msg(..))

import Keyboard
import PageType exposing (PageType(..))


type Msg
    = CloseModal
    | Next
    | Prev
    | KeyMsg Keyboard.KeyCode
    | Burger
    | ImageClick Int
    | ContentChange PageType
