module PageType exposing (PageType)

import ItalyJournals exposing (content)
import ImportantPapers exposing (content)
import PrivateDisturbance exposing (content)
import ValleyCultura exposing (content)
import Home exposing (content)
import ArtworkType exposing (ArtworkType(..))
import CourseType exposing (CourseType(..))
import Messages exposing (Msg)
import Html exposing (Html, div)


type PageType
    = Artwork ArtworkType
    | Design
    | HomePage
    | StudentWork CourseType


content : PageType -> Html Msg
content pt =
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
