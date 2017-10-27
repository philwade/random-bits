myLength :: [a] -> Int
myLength (_:xs) = 1 + myLength xs
myLength [] = 0

meanList xs =  (sum xs) `div` (myLength xs)

makePalindrome xs = xs ++ reverse xs

recursivePalindrome [] = []
recursivePalindrome (x:xs) = [x] ++ recursivePalindrome xs ++ [x]

isPalindrome [] = True
isPalindrome [a] = True
isPalindrome (x:xs)
    | x == last = isPalindrome (tail rest)
    | otherwise = False
    where rest = reverse xs
          last = head rest

intersperse :: a -> [[a]] -> [a]
intersperse _ [] = []
intersperse _ (x:[]) = x
intersperse s (x:xs) = x ++ [s] ++ intersperse s xs

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:[]) = Nothing
safeTail a = Just (tail a)

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast (x:[]) = Just x
safeLast xs = Just (head $ reverse xs)

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit (a:[]) = Just []
safeInit xs = Just (init xs)

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith func [] = [[]]
splitWith func xs =
    let (prev, next) = span func xs
    in case prev of
        [] -> takeWhile (not.func) next : splitWith func (dropWhile (not.func) next)
        _ -> prev:splitWith func next
