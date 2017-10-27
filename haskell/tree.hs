data Tree a = Node a (Tree a) (Tree a)
    | Empty
    deriving (Show)

depth Empty = 0
depth (Node root a b) = 1 + max (depth a) (depth b)

type Point = (Int, Int)
data Angle = Point Point Point
    deriving (Show)
