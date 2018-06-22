module ImageUtil exposing (..)

import Html exposing (Html, figure, div, img, a)
import Html.Attributes exposing (class, alt, src)
import Html.Events exposing (onClick)


-- example ImagePath:
-- "/path/to/image.jpg"


type alias ImagePath =
    String


type alias ImageTitle =
    String


type alias HtmlAlt =
    String



-- example BulmaDimension:
-- "is-square" or "is-128x128"


type alias BulmaDimension =
    String


divTileImgGenerator : ImagePath -> HtmlAlt -> BulmaDimension -> msg -> Html msg
divTileImgGenerator path altStr dimension msg =
    div [ class "tile is-child" ]
        [ a [ onClick msg ]
            [ figure
                [ class <| "image is-unselectable " ++ dimension ]
                [ img [ src path, alt altStr ] [] ]
            ]
        ]
