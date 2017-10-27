import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import String
import Char exposing (isUpper, isLower)

main =
    App.beginnerProgram { model = model, view = view, update = update }

-- Model
type alias Model =
    { name : String
    , password : String
    , passwordAgain : String
    , submitted : Bool
    }

model : Model
model =
    Model "" "" "" False

-- Update
type Msg
    = Name String
    | Password String
    | PasswordAgain String
    | Submitted

update : Msg -> Model -> Model
update msg model =
    case msg of
        Name name ->
            { model | name = name }
        Password password ->
            { model | password = password }
        PasswordAgain password ->
            { model | passwordAgain = password }
        Submitted ->
            { model | submitted = True }

-- View
view : Model -> Html Msg
view model =
    div []
    [ input [ type' "text", placeholder "Name", onInput Name ] []
    , input [ type' "text", placeholder "Password", onInput Password ] []
    , input [ type' "text", placeholder "Password again", onInput PasswordAgain ] []
    , div [ style [("display", showValidation model)] ]
      [ viewValidation model validateLength
        , viewValidation model validateMatch
        , viewValidation model validateContent
      ]
    , button [ onClick Submitted ] [ text "Submit" ]
    ]

showValidation : Model -> String
showValidation model =
    if model.submitted then
        "block"
    else
        "none"

viewValidation : Model -> (Model -> (Bool, String)) -> Html msg
viewValidation model validator =
    let (color, message) =
        genericValidate model validator
    in
        div [ style [("color", color)] ] [ text message ]

genericValidate : Model -> (Model -> (Bool, String)) -> (String, String)
genericValidate model validator =
    let (success, message) =
        validator model
    in
        if success then
            ("green", "OK")
        else
            ("red", message)

validateLength : Model -> (Bool, String)
validateLength model =
    (String.length model.password >= 8, "Password needs to be longer than eight characters")

validateMatch : Model -> (Bool, String)
validateMatch model =
    (model.password == model.passwordAgain, "Passwords do not match")

validateContent : Model -> (Bool, String)
validateContent model =
    (validateUpper model && validateLower model, "Password must contain upper, lower and special characters")

validateUpper model =
    String.any isUpper model.password

validateLower model =
    String.any isLower model.password
