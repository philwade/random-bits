balanced :: String -> String -> String
balanced [] [] = "YES"
balanced [] [_] = "NO"
balanced [_] [] = "NO"
balanced _ [] = "NO"
balanced [_,_] [_] = "NO"
balanced [x] [y] =
    if pair x y then
        "YES"
    else
        "NO"

balanced [] (y:ys) =
    balanced [y] ys
balanced (x:xs) (y:ys) =
    if pair x y then
        balanced xs ys
    else
        balanced ([y] ++ [x] ++ xs) ys

pair :: Char -> Char -> Bool
pair '[' ']' = True
pair '(' ')' = True
pair '{' '}' = True
pair _ _ = False
