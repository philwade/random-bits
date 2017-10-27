doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
removeNonUpperCase st = [ c | c <- st, c `elem` ['A'..'Z']]

pow :: Int -> Int -> Int
pow a 0 = 1
pow a b = a * pow a (b - 1)

-- troll
pow2 :: Int -> Int
pow2 2 = pow2 4
pow2 4 = pow2 8
pow2 8 = pow2 16
pow2 16 = pow2 32
pow2 32 = 64

pow2' :: Int
pow2' = pow2 2
