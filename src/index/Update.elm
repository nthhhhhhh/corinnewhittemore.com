module Update exposing (update)

import Messages exposing (Msg(..))
import Model exposing (Model)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        CloseModal ->
            ( model, Cmd.none )

        Next ->
            ( model, Cmd.none )

        Prev ->
            ( model, Cmd.none )

        KeyMsg code ->
            ( model, Cmd.none )

        Burger ->
            ( model, Cmd.none )

        ImageClick _ ->
            ( model, Cmd.none )
