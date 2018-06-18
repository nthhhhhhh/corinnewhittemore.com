module HeroTitles exposing (dict)

import PageType exposing (PageType(..))
import ArtworkType exposing (ArtworkType(..))
import CourseType exposing (CourseType(..))


dict : PageType -> Maybe { title : String, subtitle : String }
dict pt =
    case pt of
        Artwork t ->
            case t of
                ImportantPapers ->
                    Just { title = "Important Papers", subtitle = "Artwork" }

                ItalyJournals ->
                    Just { title = "Italy Journals", subtitle = "Artwork" }

                PrivateDisturbance ->
                    Just { title = "Private Disturbance", subtitle = "Artwork" }

                ValleyCultura ->
                    Just { title = "Valley Cultura", subtitle = "Artwork" }

        HomePage ->
            -- home page does not have a hero
            Nothing

        Design ->
            Just { title = "Design", subtitle = "" }

        StudentWork t ->
            case t of
                Typography ->
                    Just { title = "Typography", subtitle = "Student Work" }

                TeachingPhilosophy ->
                    Nothing
