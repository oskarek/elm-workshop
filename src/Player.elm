module Player exposing (Player(..), nextPlayer, playerToString)


type Player
    = NoPlayer
    | X
    | O


playerToString : Player -> String
playerToString p =
    case p of
        X ->
            "X"

        O ->
            "O"

        NoPlayer ->
            "_"


nextPlayer : Player -> Player
nextPlayer current =
    case current of
        NoPlayer ->
            X

        X ->
            O

        O ->
            X
