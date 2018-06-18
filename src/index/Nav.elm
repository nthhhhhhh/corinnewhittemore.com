module Nav exposing (RoutePath(..), fromUrlHash)

import Html exposing (Html, text, a)
import Html.Attributes exposing (href)
import Messages exposing (Msg)


type RoutePath
    = DefaultRoute
    | ArtworkRoute
    | DesignRoute
    | HomeRoute
    | StudentWorkRoute
    | NotFoundRoute


fromUrlHash : String -> RoutePath
fromUrlHash urlHash =
    let
        hashList =
            urlHash |> String.split "/" |> List.drop 1
    in
        case hashList of
            [] ->
                DefaultRoute

            [ "artwork" ] ->
                ArtworkRoute

            [ "design" ] ->
                DesignRoute

            [ "home" ] ->
                HomeRoute

            [ "studentwork" ] ->
                StudentWorkRoute

            _ ->
                NotFoundRoute
