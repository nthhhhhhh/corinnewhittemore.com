module Update exposing (update)

import Hero exposing (section_)
import HeroTitles exposing (dict)
import Messages exposing (Msg(..))
import Model exposing (Model)
import PageContent exposing (page)
import Routing exposing (parseLocation)


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

        UrlChange location ->
            ( { model
                | route = parseLocation location
                , content = page location
                , heroTitle = HeroTitles.dict location
                , hero = Hero.section_ (HeroTitles.dict location)
              }
            , Cmd.none
            )
