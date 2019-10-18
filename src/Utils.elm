module Utils exposing (listSetAt, matrixSetAt)


listSetAt : Int -> a -> List a -> List a
listSetAt index newValue list =
    List.indexedMap
        (\n current ->
            if n == index then
                newValue

            else
                current
        )
        list


matrixSetAt : ( Int, Int ) -> a -> List (List a) -> List (List a)
matrixSetAt ( x, y ) a mat =
    List.indexedMap
        (\i row ->
            if i == x then
                listSetAt y a row

            else
                row
        )
        mat
