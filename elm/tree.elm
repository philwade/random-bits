module Tree exposing (..)

type Tree a = Empty
            | Node a (Tree a) (Tree a)

exampleTree = Node 4 (Node 1 Empty Empty) (Node 9 Empty Empty)

insert : comparable -> Tree comparable -> Tree comparable
insert target tree =
    case tree of
        Empty ->
            Node target Empty Empty
        Node value left right ->
            if target > value then
                Node value left (insert target right)
            else if target < value then
                Node value (insert target left) right
            else
                tree

sum : Tree Int -> Int
sum tree =
    case tree of
        Empty -> 0
        Node value left right ->
            value + (sum left) + (sum right)
