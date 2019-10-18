module Main exposing (main)

import Board exposing (Board, Cell, Row, flipCellInBoard)
import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Player exposing (Player(..), nextPlayer, playerToString)


main =
    Browser.sandbox { init = init, update = update, view = view }



-- MODEL


type alias Model =
    { buttonValue : Player
    , currentPlayer : Player
    , board : Board
    }


init : Model
init =
    { buttonValue = X
    , currentPlayer = X
    , board =
        [ [ NoPlayer, NoPlayer, NoPlayer ]
        , [ NoPlayer, NoPlayer, NoPlayer ]
        , [ NoPlayer, NoPlayer, NoPlayer ]
        ]
    }



-- UPDATE


type Msg
    = Flip Cell


update : Msg -> Model -> Model
update msg model =
    case msg of
        Flip cell ->
            { model
                | board = flipCellInBoard cell model.currentPlayer model.board
                , currentPlayer = nextPlayer model.currentPlayer
            }



-- VIEW


view model =
    div []
        [ div [] [ text ("Current player: " ++ playerToString model.currentPlayer) ]
        , viewBoard model.board
        ]


viewBoard : Board -> Html Msg
viewBoard board =
    div [] (List.indexedMap viewRow board)


viewRow : Int -> Row -> Html Msg
viewRow rowIndex rowData =
    div [] (List.indexedMap (viewButton rowIndex) rowData)


viewButton : Int -> Int -> Player -> Html Msg
viewButton row col player =
    button [ onClick (Flip (Cell row col)) ] [ text (playerToString player) ]
