module HeroTitles exposing (dict)

import Navigation exposing (Location)
import Routing exposing (Route(..), route)
import UrlParser exposing (Parser, (</>), oneOf, parseHash, parsePath, s, top)


heroTitle : String -> String -> Maybe { title : String, subtitle : String }
heroTitle title_ subtitle_ =
    Just { title = title_, subtitle = subtitle_ }


dict : Navigation.Location -> Maybe { title : String, subtitle : String }
dict location =
    case parseHash route location of
        Just r ->
            case r of
                DefaultRoute ->
                    Nothing

                ArtworkRoute str ->
                    case str of
                        "valley_cultura" ->
                            heroTitle "Valley Cultura" "Artwork"

                        _ ->
                            heroTitle "" "Artwork"

                DesignRoute ->
                    heroTitle "Design" ""

                HomeRoute ->
                    Nothing

                StudentWorkRoute str ->
                    case str of
                        "teaching_philosophy" ->
                            heroTitle "Teaching Philosophy" "Student Work"

                        _ ->
                            heroTitle "" "Student Work"

                NotFoundRoute ->
                    Nothing

        Nothing ->
            Nothing
