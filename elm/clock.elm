import Html exposing (..)
import Html.Events exposing (onClick)
import Html.App as App
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Time exposing (Time, second)



main =
  App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }


-- MODEL

type alias Model =
    { time: Time
    , paused: Bool
    }


init : (Model, Cmd Msg)
init =
  (Model 0 False, Cmd.none)


-- UPDATE

type Msg
  = Tick Time
  | TogglePause


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Tick newTime ->
      ({model | time = newTime}, Cmd.none)
    TogglePause ->
      ({model | paused = (not model.paused)}, Cmd.none)


-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
  if model.paused then
    Sub.none
  else
    Time.every second Tick


-- VIEW

view : Model -> Html Msg
view model =
  let
    (handX, handY) = timeAngle model.time Time.inMinutes
    (hourHandX, hourHandY) = timeAngle model.time Time.inHours
  in
    div []
    [Svg.svg [ viewBox "0 0 100 100", width "300px" ]
      [ circle [ cx "50", cy "50", r "45", fill "#0B79CE" ] []
      , line [ x1 "50", y1 "50", x2 handX, y2 handY, stroke "#023963" ] []
      , line [ x1 "50", y1 "50", x2 hourHandX, y2 hourHandY, stroke "#023963" ] []
      ]
     , button [ onClick TogglePause ] [ Html.text "Pause" ]
    ]

-- LIB
timeAngle : Time -> (Time.Time -> Float) -> (String, String)
timeAngle time timeFunc =
    let
        angle =
          turns (timeFunc time)

        handX =
          toString (50 + 40 * cos angle)

        handY =
          toString (50 + 40 * sin angle)
    in
        (handX, handY)
