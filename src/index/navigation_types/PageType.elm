module PageType exposing (PageType(..))

import ArtworkType exposing (ArtworkType(..))
import CourseType exposing (CourseType(..))


type PageType
    = Artwork ArtworkType
    | Design
    | HomePage
    | StudentWork CourseType
