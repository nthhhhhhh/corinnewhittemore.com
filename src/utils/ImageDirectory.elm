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

            "2ar" ->
                imageInfo
                    "ar"
                    (workingDir 2 "ar-1.png")
                    "is-square"

            "2dlm" ->
                imageInfo
                    "dlm"
                    (workingDir 2 "dlm-1.png")
                    "is-square"

            "2jar" ->
                imageInfo
                    "jar"
                    (workingDir 2 "jar-1.png")
                    "is-square"

            "2jv" ->
                imageInfo
                    "jv"
                    (workingDir 2 "jv-1.png")
                    "is-square"

            "2ks" ->
                imageInfo
                    "ks"
                    (workingDir 2 "ks-2.png")
                    "is-square"

            "2lpm" ->
                imageInfo
                    "lpm"
                    (workingDir 2 "lpm-2.png")
                    "is-square"

            "3 1-1" ->
                imageInfo
                    "1-1"
                    (workingDir 3 "page1-1.jpg")
                    "is-square"

            "3 4-4" ->
                imageInfo
                    "4-4"
                    (workingDir 3 "page4-4.jpg")
                    "is-square"

            "3 6-1" ->
                imageInfo
                    "6-1"
                    (workingDir 3 "page6-1.jpg")
                    "is-square"

            "3 12-3" ->
                imageInfo
                    "12-3"
                    (workingDir 3 "page12-3.jpg")
                    "is-square"

            "3 14-3" ->
                imageInfo
                    "14-3"
                    (workingDir 3 "page14-3.jpg")
                    "is-square"

            "3 16" ->
                imageInfo
                    "16"
                    (workingDir 3 "page16.jpg")
                    "is-square"

            "4 1" ->
                imageInfo
                    "1"
                    (workingDir 4 "project4_ex1.jpg")
                    "is-800x604"

            "4 2" ->
                imageInfo
                    "2"
                    (workingDir 4 "project4_ex2.jpg")
                    "is-800x604"

            "4 3" ->
                imageInfo
                    "3"
                    (workingDir 4 "project4_ex3.jpg")
                    "is-542x677"

            "4 5" ->
                imageInfo
                    "5"
                    (workingDir 4 "project4_ex5.jpg")
                    "is-542x677"

            "5anxious" ->
                imageInfo
                    "anxious"
                    (workingDir 5 "anxious.png")
                    "is-710x668"

            "5chaotic" ->
                imageInfo
                    "chaotic"
                    (workingDir 5 "chaotic.png")
                    "is-710x668"

            "5curious" ->
                imageInfo
                    "curious"
                    (workingDir 5 "curious.png")
                    "is-710x668"

            "5grouchy" ->
                imageInfo
                    "grouchy"
                    (workingDir 5 "grouchy.png")
                    "is-710x668"

            "5jubilant" ->
                imageInfo
                    "jubilant"
                    (workingDir 5 "jubilant.png")
                    "is-710x668"

            "5serene" ->
                imageInfo
                    "serene"
                    (workingDir 5 "serene.png")
                    "is-710x668"

            "6 1" ->
                imageInfo
                    "1"
                    (workingDir 6 "project5_ex1-678x720.jpg")
                    "is-678x720"

            "6 3" ->
                imageInfo
                    "3"
                    (workingDir 6 "project5_ex3.jpg")
                    "is-983x621"

            "6 4" ->
                imageInfo
                    "4"
                    (workingDir 6 "project5_ex4.jpg")
                    "is-983x621"

            "6 5" ->
                imageInfo
                    "5"
                    (workingDir 6 "project5_ex5-680x720.jpg")
                    "is-680x720"

            "6 6" ->
                imageInfo
                    "6"
                    (workingDir 6 "project5_ex6-687x720.jpg")
                    "is-687x720"

            "6 7" ->
                imageInfo
                    "7"
                    (workingDir 6 "project5_ex7-625x720.jpg")
                    "is-625x720"

            "6 8" ->
                imageInfo
                    "8"
                    (workingDir 6 "project5_ex8-627x720.jpg")
                    "is-627x720"

            "6 9" ->
                imageInfo
                    "9"
                    (workingDir 6 "project5_ex9-647x720.jpg")
                    "is-647x720"

            _ ->
                notFoundResult
