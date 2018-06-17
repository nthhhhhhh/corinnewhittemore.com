module PageContent exposing (html_)

import ArtworkType exposing (ArtworkType(..))
import CourseType exposing (CourseType(..))
import Html exposing (Html)
import Messages exposing (Msg)
import Home exposing (content)
import ItalyJournals exposing (content)
import ImportantPapers exposing (content)
import PageType exposing (PageType(..))
import PrivateDisturbance exposing (content)
import ValleyCultura exposing (content)
import Html exposing (div)


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
