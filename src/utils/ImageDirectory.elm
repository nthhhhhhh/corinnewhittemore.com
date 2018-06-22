module ImageDirectory exposing (designOneImages, paths, resolutions, titles)

import HtmlUtils exposing (AltString)
import ImageUtil exposing (ImagePath, BulmaDimension)
import String.Extra exposing (fromInt)


rootDirectory : String
rootDirectory =
    "./images"


type alias ImageInfo =
    { title : AltString, path : ImagePath, resolution : BulmaDimension }


imageInfo : AltString -> ImagePath -> BulmaDimension -> ImageInfo
imageInfo alt ip bd =
    { title = alt, path = ip, resolution = bd }


type alias ImageLookup =
    String -> ImageInfo


notFoundResult : ImageInfo
notFoundResult =
    { title = "Not Found"
    , path = "./images/notfound.gif"
    , resolution = "is-square"
    }


titles : ImageLookup -> List AltString -> List AltString
titles l =
    List.map (.title << l)


paths : ImageLookup -> List ImagePath -> List ImagePath
paths l =
    List.map (.path << l)


resolutions : ImageLookup -> List String -> List BulmaDimension
resolutions l =
    List.map (.resolution << l)


studentWorkDir : String
studentWorkDir =
    rootDirectory ++ "/studentwork"


designOneImages : ImageLookup
designOneImages key =
    let
        designOneDir =
            "/1_ARTS1311-DesignOne"

        workingDir projectNum imagename =
            studentWorkDir
                ++ designOneDir
                ++ "/"
                ++ "project_"
                ++ fromInt projectNum
                ++ "/"
                ++ imagename
    in
        case key of
            "1cindy" ->
                imageInfo
                    "cindy"
                    (workingDir 1 "cindy_squares.png")
                    "is-625x621"

            "1dlm" ->
                imageInfo
                    "dlm"
                    (workingDir 1 "dlm_squares.png")
                    "is-square"

            "1jj" ->
                imageInfo
                    "jj"
                    (workingDir 1 "jj_squares.png")
                    "is-623x624"

            "1js" ->
                imageInfo
                    "js"
                    (workingDir 1 "js_squares.png")
                    "is-square"

            _ ->
                notFoundResult
