import qualified Data.Map as Map

countKeys :: String -> Map.Map Char Integer
countKeys a = foldl countHelper (Map.fromList []) a

countHelper :: Map.Map Char Integer -> Char -> Map.Map Char Integer
countHelper acc key = Map.insertWith (+) key 1 acc

diffKeys :: Map.Map Char Integer -> Map.Map Char Integer -> Map.Map Char Integer
diffKeys a b = Map.union (diffKeyshelper a b) (diffKeyshelper b a)

diffKeyshelper a b = Map.differenceWith (\al ar -> if al == ar then Nothing else Just $ abs $ al - ar) a b

sumDiff :: Map.Map Char Integer -> Integer
sumDiff = foldl (+) 0
