module PageContent exposing (html_, pageContent)

import ArtworkType exposing (ArtworkType(..))
import CourseType exposing (CourseType(..))
import Home exposing (content)
import Html exposing (Html, div)
import ImportantPapers exposing (content)
import ItalyJournals exposing (content)
import Messages exposing (Msg)
import Model exposing (Model)
import Nav exposing (fromUrlHash, RoutePath(..))
import PageType exposing (PageType(..))
import PrivateDisturbance exposing (content)
import ValleyCultura exposing (content)


html_ : PageType -> Html Msg
html_ pt =
    case pt of
        Artwork t ->
            case t of
                ImportantPapers ->
                    ImportantPapers.content

                ItalyJournals ->
                    ItalyJournals.content

                PrivateDisturbance ->
                    PrivateDisturbance.content

                ValleyCultura ->
                    ValleyCultura.content

        HomePage ->
            Home.content

        Design ->
            div [] []

        StudentWork t ->
            case t of
                Typography ->
                    div [] []

                TeachingPhilosophy ->
                    div [] []


pageContent : Model -> Html Msg
pageContent model =
    let
        routePath =
            fromUrlHash model.currentRoute.hash
    in
        case routePath of
            DefaultRoute ->
                Home.content

            ArtworkRoute ->
                ValleyCultura.content

            DesignRoute ->
                div [] []

            HomeRoute ->
                Home.content

            StudentWorkRoute ->
                div [] []

            NotFoundRoute ->
                div [] []
