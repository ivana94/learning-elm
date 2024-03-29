-- Elm: purely functional
-- data types: INT, FLOAT, LIST NUM, LIST STRING, STRING, BOOL, CHAR, DICT
-- everything in a list must be of the same data type
type alias User = { name: String }
User "Ivana" -- returns { name: "Ivana" }

-- Elm dictionaries can store different data types
type alias User = { name: String, age: Int, height: Float }

-- initialize variable with value
x = 5

-- invoke function and pass arguments
-- some functions built into Elm
-- max, min, sqrt, round, floor come from Basics module
max 9 1

-- functions from String module (https://package.elm-lang.org/packages/elm-lang/core/latest/String)
String.fromList [ 'a', 'b', 'c' ] -- returns 'abc' (String)
String.fromInt 10 ++ "!!!!" -- returns "10!!!!" (String)
String.toUpper "hello" -- returns "HELLO" (String)
String.split "," "Apple,Apricot,Avocado,Banana,Blackberry" -- returns ["Apple","Apricot","Avocado","Banana","Blackberry"] (List String)
 String.join "^--^" [ "apple", "banana", "mango" ] -- returns "apple^--^banana^--^mango" (String)


-- we can import other modules into our modules
-- using Dict (https://package.elm-lang.org/packages/elm-lang/core/latest/Dict)



-- functions in Elm are like JS functions that return functions
-- let's say we have: add x y = x + y
-- to call this function: add 1 3 (returns 4)
-- but you can call add and only pass it one argument: add 5
-- and then later pass the second argument to add
-- You can do this in Elm because Elm basically creates functions that return functions
-- to rewrite add with JS:
-- const add = x => y => x + y
-- you can call add and pass it x, and then that returns a function
-- that accepts y as an argument. I can call that y function whenever I know
-- the value of y
