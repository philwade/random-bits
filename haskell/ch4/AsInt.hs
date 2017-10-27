import Data.Char (digitToInt)

asInt :: String -> Int
asInt xs = loop 0 xs

loop :: Int -> String -> Int
loop acc [] = acc
loop acc (x:xs) = let acc' = acc * 10 + digitToInt x
                  in loop acc' xs

asInt' :: String -> Int
asInt' [] = 0
asInt' (x:xs)
    | x == '-' = -1 * asInt' xs
    | otherwise = foldl step 0 (x:xs)
    where step acc x = acc * 10 + digitToInt x

concat' :: [[a]] -> [a]
concat' xs = foldr step [] xs
    where step acc x = acc ++ x

groupBy' :: (a -> a -> Bool) -> [a] -> [[a]]
groupBy' func xs = foldr step [] xs
    where step y [] = [[y]]
          step y ([]:ass) = [y]:ass
          step y ((a:as):ass)
            | func a y = (y:a:as):ass
            | otherwise = [y]:(a:as):ass
