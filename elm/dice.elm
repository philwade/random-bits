import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Random

main =
    App.program { init = init, view = view, update = update, subscriptions = subscriptions }

type alias Model =
    { face1: Int
    , face2: Int
    }

type Msg = Roll
         | Dice1 Int
         | Dice2 Int

init : (Model, Cmd Msg)
init =
    (Model 1 1, Cmd.none)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        Roll ->
            (model, Random.generate Dice1 (Random.int 1 6))
        Dice1 face ->
            ({ model | face1 = face}, Random.generate Dice2 (Random.int 1 6))
        Dice2 face ->
            ({ model | face2 = face}, Cmd.none)


view : Model -> Html Msg
view model =
    div []
    [ text (toString model.face1)
    , text (toString model.face2)
    , button [ onClick Roll ] [ text "Roll" ]
    ]

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
