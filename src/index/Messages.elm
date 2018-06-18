module Messages exposing (Msg(..))

import Keyboard
import Navigation
import PageType exposing (PageType(..))


-- WARN
{--contentchange and pagetype should be replaced by
  - urlchange and navigation.location respectively --}


type Msg
    = CloseModal
    | Next
    | Prev
    | KeyMsg Keyboard.KeyCode
    | Burger
    | ImageClick Int
    | ContentChange PageType
    | UrlChange Navigation.Location
