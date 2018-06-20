module Routing exposing (Route(..), route, parseLocation)

import UrlParser exposing (Parser, (</>), parseHash, string, oneOf, top, s)
import Maybe
import Navigation


type Route
    = DefaultRoute
    | ArtworkRoute String
    | DesignRoute
    | HomeRoute
    | StudentWorkRoute String
    | NotFoundRoute


route : Parser (Route -> a) a
route =
    oneOf
        [ UrlParser.map DefaultRoute (s "")
        , UrlParser.map ArtworkRoute (s "artwork" </> string)
        , UrlParser.map DesignRoute (s "design")
        , UrlParser.map HomeRoute (s "home")
        , UrlParser.map StudentWorkRoute (s "studentwork" </> string)
        , UrlParser.map NotFoundRoute (s "404")
        ]


parseLocation : Navigation.Location -> Route
parseLocation location =
    Maybe.withDefault NotFoundRoute (parseHash route location)
