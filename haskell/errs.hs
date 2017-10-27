safeSecond :: [a] -> Maybe a
safeSecond [] = Nothing
safeSecond xs = if null (tail xs)
    then Nothing
    else Just (head (tail xs))

tidySecond :: [a] -> Maybe a
tidySecond (_:x:_) = Just x
tidySecond _ = Nothing

data Fruit = Apple | Orange
    deriving (Show)

apple = "apple"
orange = "orange"

fruit f = case f of
    "apple" -> Apple
    "orange" -> Orange

lend amount balance
    | amount <= 0 = Nothing
    | amount > reserve = Nothing
    | otherwise = Just newBalance
    where reserve = 100
          newBalance = balance - amount
