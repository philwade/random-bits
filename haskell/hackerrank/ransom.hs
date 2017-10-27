import qualified Data.Map.Strict as Map

countKeys :: [String] -> Map.Map String Integer
countKeys a = foldl countHelper (Map.fromList []) a

countHelper :: Map.Map String Integer -> String -> Map.Map String Integer
countHelper acc key = Map.insertWith (+) key 1 acc

diffKeys a b = Map.differenceWith (\al ar -> if al <= ar then Nothing else Just $ abs $ al - ar) a b

testRansom :: [String] -> [String] -> Answer
testRansom magazine ransom =
    let
        magazineKeyed = countKeys magazine
        ransomKeyed = countKeys ransom
        diff = diffKeys ransomKeyed magazineKeyed
    in
        case Map.size diff of
            0 -> Yes
            _ -> No

data Answer = Yes | No
