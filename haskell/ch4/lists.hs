and' [] = True
and' [True] = True
and' [False] = False
and' (x:xs) = x == True || and' xs

all' :: (a -> Bool) -> [a] -> Bool
all' _ [] = True
all' function [a] = function a
all' function (x:xs) = (function x) && all' function xs

any' :: (a -> Bool) -> [a] -> Bool
any' _ [] = True
any' function [a] = function a
any' function (x:xs) = (function x) || any' function xs

take' :: Int -> [a] -> [a]
take' _ [] = []
take' 0 _ = []
take' _ (x:[]) = x:[]
take' n (x:xs) = x : take' (n - 1) xs

drop' :: Int -> [a] -> [a]
drop' 0 xs = xs
drop' n (_:xs) = drop' (n - 1) xs

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' func (x:xs)
    | func x == True = x:takeWhile func xs
    | otherwise = x:[]


splitAt' :: Int -> [a] -> ([a], [a])
splitAt' n xs = (take' n xs, drop' n xs)

filter' :: (a -> Bool) -> [a] -> [a]
filter' _ [] = []
filter' func (x:xs)
    | func x == True = x : filter' func xs
    | otherwise      = filter' func xs

zipWith' :: [a] -> [b] -> [(a, b)]
zipWith' (x:[]) (y:[]) = [(x, y)]
zipWith' (x:[]) (y:ys) = [(x, y)]
zipWith' (x:xs) (y:[]) = [(x, y)]
zipWith' (x:xs) (y:ys) = [(x, y)] ++ zipWith' xs ys
