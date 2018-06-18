module Update exposing (update)

import Hero exposing (section_)
import HeroTitles exposing (dict)
import Messages exposing (Msg(..))
import Model exposing (Model)
import PageContent exposing (html_)


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

        ContentChange pt ->
            ( { model
                | content = html_ pt
                , heroTitle = HeroTitles.dict pt
                , hero = Hero.section_ (HeroTitles.dict pt)
              }
            , Cmd.none
            )

        UrlChange location ->
            let
                _ =
                    Debug.log "hash:" location.hash
            in
                ( { model | currentRoute = location }, Cmd.none )
