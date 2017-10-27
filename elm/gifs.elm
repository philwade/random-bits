import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, on)
import Task exposing (..)
import Http
import Json.Decode as Json

main =
    App.program { init = init, view = view, update = update, subscriptions = subscriptions }

-- model
type alias Item =
    { id: Int
    , value: String
    }
type alias Model =
    { topic : String
    , gifUrl: String
    , failureMessage : String
    , options: List Item
    }

init : (Model, Cmd Msg)
init =
    (Model "cats" "waiting.gif" "" [Item 0 "cats", Item 1 "dogs", Item 2 "burgers"],
    getRandomGif "waiting")

-- UPDATE

type Msg
    = MorePlease
    | FetchSucceed String
    | FetchFail Http.Error
    | ChangeTopic Int

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    MorePlease ->
        (model, getRandomGif model.topic)
    FetchSucceed url ->
        ({ model | gifUrl = url}, Cmd.none)
    FetchFail failure ->
        ({ model | failureMessage = (handleError failure) }, Cmd.none)
    ChangeTopic topicId ->
        let
            newTopic = getItemById topicId model.topic model.options
        in
            ({ model | topic = newTopic }, getRandomGif newTopic)

getRandomGif : String -> Cmd Msg
getRandomGif topic =
    let
        url = "https://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=" ++ topic
    in
        Task.perform FetchFail FetchSucceed (Http.get decodeGifUrl url)

decodeGifUrl : Json.Decoder String
decodeGifUrl =
    Json.at ["data", "image_url"] Json.string

handleError : Http.Error -> String
handleError error =
    case error of
        Http.Timeout ->
            "Http timeout"
        Http.NetworkError ->
            "Network connection missing"
        Http.UnexpectedPayload message ->
            "Json problem: " ++ message
        Http.BadResponse code message ->
            "Got a bad response: " ++ (toString code) ++ " " ++ message

-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ h2 [] [text model.topic]
    , img [src model.gifUrl] []
    , button [ onClick MorePlease ] [ text "More Please!" ]
    , h2 [] [ text model.failureMessage ]
    , select [ onSelect ChangeTopic ] (List.map (\item -> option [ value (toString item.id) ] [ text item.value ]) model.options)
    ]

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- Extras
targetSelectedIndex : Json.Decoder Int
targetSelectedIndex =
    Json.at [ "target", "selectedIndex" ] Json.int


onSelect : (Int -> msg) -> Html.Attribute msg
onSelect msg =
    on "change" (Json.map msg targetSelectedIndex)

getItemById : Int -> String -> List Item -> String
getItemById id fallback items =
    List.foldl (\val acc -> if val.id == id then val.value else acc) fallback items
