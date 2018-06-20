module PageContent exposing (page)

import Home exposing (content)
import Html exposing (Html, div, text)
import ImportantPapers exposing (content)
import ItalyJournals exposing (content)
import Messages exposing (Msg)
import Navigation
import Routing exposing (Route(..), route, parseLocation)
import UrlParser exposing (parseHash)
import PrivateDisturbance exposing (content)
import ValleyCultura exposing (content)


page : Navigation.Location -> Html Msg
page location =
    case parseLocation location of
        DefaultRoute ->
            Home.content

        ArtworkRoute str ->
            case str of
                "valley_cultura" ->
                    ValleyCultura.content

                _ ->
                    div [] []

        DesignRoute ->
            div [] []

        HomeRoute ->
            Home.content

        StudentWorkRoute str ->
            case str of
                "teaching_philosophy" ->
                    div [] []

                _ ->
                    div [] []

        NotFoundRoute ->
            text "Not Found"
