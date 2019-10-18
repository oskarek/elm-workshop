module Board exposing (Board, Cell, Row, flipCellInBoard)

import Player exposing (Player)
import Utils


type alias Cell =
    { row : Int, col : Int }


type alias Board =
    List Row


type alias Row =
    List Player


flipCellInBoard : Cell -> Player -> Board -> Board
flipCellInBoard cell player board =
    Utils.matrixSetAt ( cell.row, cell.col ) player board
