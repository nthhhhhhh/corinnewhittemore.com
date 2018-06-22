module PageContent exposing (page)

import Home exposing (content)
import Html exposing (Html, div, text)
import ImportantPapers exposing (content)
import ItalyJournals exposing (content)
import DesignOne1 exposing (content)
import DesignOne2 exposing (content)
import DesignOne3 exposing (content)
import DesignOne4 exposing (content)
import DesignOne5 exposing (content)
import DesignOne6 exposing (content)
import DigitalMedia1 exposing (content)
import Messages exposing (Msg)
import Navigation
import NotFound exposing (content)
import Routing exposing (Route(..), route, parseLocation)
import PrivateDisturbance exposing (content)
import TeachingPhilosophy exposing (content)
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

                "important_papers" ->
                    ImportantPapers.content

                "italy_journals" ->
                    ItalyJournals.content

                "private_disturbance" ->
                    PrivateDisturbance.content

                _ ->
                    NotFound.content

        DesignRoute ->
            text "Design"

        HomeRoute ->
            Home.content

        StudentWorkRoute str i ->
            case str of
                "teaching_philosophy" ->
                    TeachingPhilosophy.content

                "design_one" ->
                    case i of
                        1 ->
                            DesignOne1.content i

                        2 ->
                            DesignOne2.content i

                        3 ->
                            DesignOne3.content i

                        4 ->
                            DesignOne4.content i

                        5 ->
                            DesignOne5.content i

                        6 ->
                            DesignOne6.content i

                        _ ->
                            NotFound.content

                "design_two" ->
                    case i of
                        _ ->
                            text "Design Two"

                "digital_media" ->
                    case i of
                        1 ->
                            DigitalMedia1.content i

                        _ ->
                            NotFound.content

                "independent_study" ->
                    case i of
                        _ ->
                            text "Independent Study"

                _ ->
                    NotFound.content

        NotFoundRoute ->
            NotFound.content
