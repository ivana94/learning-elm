# elm

[I followed the tutorial here!](https://elmbridge.github.io/curriculum/)



**Elm**: purely functional
data types: INT, FLOAT, LIST NUM, LIST STRING, STRING, BOOL, CHAR, DICT
everything in a list must be of the same data type

```elm
type alias User = { name: String }
User "Ivana" -- returns { name: "Ivana" }

-- Elm dictionaries can store different data types
type alias User = { name: String, age: Int, height: Float }
```



initialize variable with value

```elm
x = 5
```



invoke function and pass arguments
some functions built into Elm
max, min, sqrt, round, floor come from Basics module

```elm
max 9 1
```



functions from String module (https://package.elm-lang.org/packages/elm-lang/core/latest/String)

```elm
String.fromList [ 'a', 'b', 'c' ] -- returns 'abc' (String)
String.fromInt 10 ++ "!!!!" -- returns "10!!!!" (String)
String.toUpper "hello" -- returns "HELLO" (String)
String.split "," "Apple,Apricot,Avocado,Banana,Blackberry" -- returns ["Apple","Apricot","Avocado","Banana","Blackberry"] (List String)
 String.join "^--^" [ "apple", "banana", "mango" ] -- returns "apple^--^banana^--^mango" (String)
```



we can import other modules into our modules
using Dict (https://package.elm-lang.org/packages/elm-lang/core/latest/Dict)



functions in Elm are like JS functions that return functions
let's say we have: 

```elm
add x y = x + y
```

to call this function:

```elm
add 1 3 (returns 4)
```

but you can call add and only pass it one argument:

```elm
add 5
```

and then later pass the second argument to add
You can do this in Elm because Elm basically creates functions that return functions
to rewrite add with JS:

```javascript
const add = x => y => x + y
```

you can call add and pass it x, and then that returns a function that accepts y as an argument. I can call that y function whenever I know the value of y

Functions have types too. Functions will show something like `Int -> String -> Float`. Int and String refer to the types of arguments passed to a function, and float is the data type of the returned value. 

```elm
multiplyByThree x = x * 3 -- <function> : number -> number
```







## The Development Environment

Elm code must be compiled into JS. Browsers can't understand Elm, therefore it must be compiled into JS.

`elm reactor` is a useful command that starts a local dev server. 

The `main` function describes the initialization logic for the application. 

```elm
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }
```

It requires 3 basic pieces of information:

- `model` 
  - describes the state of our application
  - the app will create new model values as the user interacts with the app 
- `view`
  - converts the model into HTML
  - maps all possible user actions to `messages` 
- `update` 
  - responsible for updating the app's state based on triggered `messages` 
  - consumes the current app state (`model`) and a single `message`. Then it returns a new `model` that describes the app's new state. 
  - sounds like Redux

So `model`, `view`, and `update` form the triforce of Elm.





### model.

```elm
type alias Model =
    { buttonLabel : String }


init : Model
init =
    { buttonLabel = "hello world!" }
```

The init function returns a record, which is a key-value pair. This particular record represents the state or `model` of our application. In this case our app only has 1 state property — `buttonLabel` whose value is `"hello world!"` 

It is convention to write a **type alias** to describe your application's state, and call it `Model`, like this:

```elm
type alias Model =
    { buttonLabel : String }
```

We use type aliases for convenience.

The model is passed as arguments to the view and update functions. We don't directly change the model. Instead we pass a different argument to the view and update functions. 





### view.

The view is responsible for converting our `model` into HTML. Any changes between HTML that was just generated and the HTML currently onscreen will be generated to the UI by Elm. Like front-end frameworks Elm has its own way of describing UI. Here's how Elm would describe some UI:

```elm
view model =
    Html.div
        [ Html.Attributes.class "skeleton-elm-project" ]
        [ Html.node "link"
            [ Html.Attributes.rel "stylesheet"
            , Html.Attributes.href "stylesheets/main.css"
            ]
            []
        , Html.div
            [ Html.Attributes.class "waves-effect waves-light btn-large"
            , Html.Events.onClick ChangeText
            ]
            [ Html.text model.buttonLabel ]
        ]
```

This would compile to:

```html
<div class="skeleton-elm-project">
  <link rel="stylesheet" href="stylesheets/main.css">
  <div class="waves-effect waves-light btn-large">
    hello world!
  </div>
</div>	
```





### update.

When a message, or action, is triggered by the UI, update will take two arguments: the message and the current model, and it returns a new model. The view function receives this new model and updates the UI.

```elm
update msg model =
    case msg of
        ChangeText ->
            if model.buttonLabel == "hello world!" then
                { model | buttonLabel = "goodbye world!" }
            else
                { model | buttonLabel = "hello world!" }
```





