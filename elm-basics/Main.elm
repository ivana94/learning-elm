module Main exposing (main)

import ExerciseRunner exposing (..)
import Html exposing (Html)
import Html.Attributes
import String



--
-- Strings
--


sayHello : String -> String
sayHello friendsName =
    "Hello, " ++ friendsName


formatPhoneNumber : String -> String -> String -> String
formatPhoneNumber areaCode exchange local =
    "(" ++ areaCode ++ ") " ++ exchange ++ "-" ++ local


initials : String -> String -> String
initials firstName lastName =
    String.left 1 firstName ++ String.left 1 lastName



--
-- If Statements
--


isGreaterThanTen : Int -> Bool
isGreaterThanTen x =
    x > 10


howHotIsThePepper : Float -> String
howHotIsThePepper heatUnits =
    if heatUnits == 2 then
        "not hot"
    else if heatUnits == 100 then
        "mild"
    else if heatUnits == 3000 then
        "medium"
    else
        "hot"



--
-- Lists
--


reverseTheList : List a -> List a
reverseTheList inputList =
    List.reverse inputList


addOneTo x = x + 1
addOne : List Int -> List Int
addOne inputList =
    List.map addOneTo inputList


oTest name =
    if String.left 1 name /= "O" then
        True
    else
        False

removeOs : List String -> List String
removeOs inputList =
    List.filter oTest inputList



--
-- Records
--


type alias Person =
    { name : String, age : Int }


newborn : String -> { name : String, age : Int }
newborn name =
    Person name 0


ageDifference : { name : String, age : Int } -> { name : String, age : Int } -> Int
ageDifference person1 person2 =
    abs (person1.age - person2.age)


nameChange : String -> { name : String, age : Int } -> { name : String, age : Int }
nameChange newName person =
    { person | name = newName }


getOlder : { name : String, age : Int } -> { name : String, age : Int }
getOlder person =
    -- TODO: fix me
    { person | age = age + 1 }


combinedYears : List { name : String, age : Int } -> Int
combinedYears people =
    -- TODO: fix me
    0



--
-- BONUS TIME!
--
--
-- Tuples
--


signAndMagnitude : Int -> ( String, Int )
signAndMagnitude x =
    -- TODO: implement me
    ( "TODO", 0 )



--
-- String (cont.)
--


pigLatin : String -> String
pigLatin word =
    -- To go from English to pig latin, take the first letter of the word
    -- and put it at the end of the word, followed by an "ay" sound.
    -- Pig latin, in pig latin, is "Ig-pay atin-lay"
    -- For this exercise, just worry about producing a single word in pig latin.
    "TODO: implement me"



--
-- Congratulations!  You've finished!
--
--
--
--
-- There's no need to look below this line (unless you are curious)
--


examples : List ( String, List Example )
examples =
    [ ( "Strings"
      , [ functionExample1 "sayHello"
            sayHello
            [ ( "Jasmine", "Hello, Jasmine" )
            , ( "Jean", "Hello, Jean" )
            ]
        , functionExample3 "formatPhoneNumber"
            formatPhoneNumber
            [ ( ( "347", "489", "4608" ), "(347) 489-4608" )
            , ( ( "800", "555", "2368" ), "(800) 555-2368" )
            ]
        , functionExample2 "initials"
            initials
            [ ( ( "Ada", "Yonath" ), "AY" )
            , ( ( "Kimberlé", "Crenshaw" ), "KC" )
            , ( ( "Dorothy", "Hodgkin" ), "DH" )
            ]
        ]
      )
    , ( "If Statements"
      , [ functionExample1 "isGreaterThanTen"
            isGreaterThanTen
            [ ( 13, True )
            , ( 3, False )
            , ( 10, False )
            ]
        , functionExample1 "howHotIsThePepper"
            howHotIsThePepper
            [ ( 2, "not hot" )
            , ( 100, "mild" )
            , ( 3000, "medium" )
            , ( 50000, "hot" )
            ]
        ]
      )
    , ( "Lists"
      , [ functionExample1 "reverseTheList"
            reverseTheList
            [ ( [ 7, 0, 1, 4, 9 ], [ 9, 4, 1, 0, 7 ] )
            , ( [ 99, -1 ], [ -1, 99 ] )
            ]
        , functionExample1 "addOne"
            addOne
            [ ( [ 7, 0, 1, 4, 9 ], [ 8, 1, 2, 5, 10 ] )
            , ( [ 99, -1 ], [ 100, 0 ] )
            ]
        , functionExample1 "removeOs"
            removeOs
            [ ( [ "Jessie", "Anibus", "Osirus" ], [ "Jessie", "Anibus" ] )
            , ( [ "Apple", "Banana" ], [ "Apple", "Banana" ] )
            , ( [ "Octothorpe", "Octohash" ], [] )
            ]
        ]
      )
    , ( "Records"
      , [ functionExample1 "newborn"
            newborn
            [ ( "Jenny", { name = "Jenny", age = 0 } )
            , ( "Abey", { name = "Abey", age = 0 } )
            ]
        , functionExample2 "ageDifference"
            ageDifference
            [ ( ( { name = "Nicole", age = 40 }, { name = "Angel", age = 30 } ), 10 )
            , ( ( { name = "Igor", age = 18 }, { name = "Alexei", age = 23 } ), 5 )
            ]
        , functionExample2 "nameChange"
            nameChange
            [ ( ( "Mr. T", { name = "Laurence", age = 34 } ), { name = "Mr. T", age = 34 } )
            , ( ( "Demi", { name = "Demetria", age = 17 } ), { name = "Demi", age = 17 } )
            , ( ( "Ƭ̵̬̊", { name = "Prince", age = 35 } ), { name = "Ƭ̵̬̊", age = 35 } )
            ]
        , functionExample1 "getOlder"
            getOlder
            [ ( { name = "Jenny", age = 0 }, { name = "Jenny", age = 1 } )
            , ( { name = "Igor", age = 18 }, { name = "Igor", age = 19 } )
            ]
        , functionExample1 "combinedYears"
            combinedYears
            [ ( [ { name = "Ruth Bader Ginsburg", age = 83 }
                , { name = "Gloria Allred", age = 75 }
                , { name = "Caroline Kennedy", age = 58 }
                ]
              , 216
              )
            , ( [ { name = "Amy Poehler", age = 45 }
                , { name = "Chris Pratt", age = 37 }
                , { name = "Rashida Jones", age = 40 }
                , { name = "Aziz Ansari", age = 33 }
                , { name = "Retta", age = 46 }
                ]
              , 201
              )
            ]
        ]
      )

    -- , ( "HTML", [] )
    ]


bonusExamples : List ( String, List Example )
bonusExamples =
    [ ( "Tuples"
      , [ functionExample1 "signAndMagnitude"
            signAndMagnitude
            [ ( -7, ( "-", 7 ) )
            , ( 3, ( "+", 3 ) )
            , ( 10, ( "+", 10 ) )
            , ( -44, ( "-", 44 ) )
            ]
        ]
      )
    , ( "Strings (cont.)"
      , [ functionExample1 "pigLatin"
            pigLatin
            [ ( "Pig", "Ig-pay" )
            , ( "Latin", "Atin-lay" )
            ]
        ]
      )

    -- , ( "Union types", [] )
    -- , ( "Case statements", [] )
    -- , ( "Maybes", [] )
    -- , ( "Complex case statements", [] )
    -- , ( "Dictionaries", [] )
    ]


main : Html Never
main =
    Html.div
        [ Html.Attributes.style "padding" "20px" ]
        [ fontStyles
        , examples
            |> List.map (\( title, x ) -> viewExampleSection title x)
            |> Html.div []
        , Html.h1 [] [ Html.text "Bonus Sections" ]
        , bonusExamples
            |> List.map (\( title, x ) -> viewExampleSection title x)
            |> Html.div []
        ]
