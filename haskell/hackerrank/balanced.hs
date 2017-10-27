balanced :: String -> String -> String
balanced [] [] = "YES"
balanced [] [_] = "NO"
balanced [_] [] = "NO"
balanced [_,_] [_] = "NO"
balanced _ [] = "NO"
balanced [y] [x] =
    if pair y x then
        "YES"
    else
        "NO"
balanced [y] [x,x2] = "NO"
balanced (y:ys) [x,x2] =
    if pair x x2 then
        "NO"
    else
        if pair y x then
            balanced ys [x2]
        else
            balanced ([x] ++ [y] ++ ys) [x2]
balanced [] [x,x2] =
    if pair x x2 then
        "YES"
    else
        "NO"
balanced [] (x:x2:xs) =
    if pair x x2 then
        balanced [] xs
    else
        balanced [x] ([x2] ++ xs)
balanced [y] (x:x2:xs) =
    if pair x x2 then
        balanced [y] xs
    else
        if pair x y then
            balanced [] ([x2] ++ xs)
        else
            balanced ([x] ++ [y]) ([x2] ++ xs)
balanced (y:ys) (x:x2:xs) =
    if pair x x2 then
        balanced ([y] ++ ys) xs
    else
        if pair x y then
            balanced ys ([x2] ++ xs)
        else
            balanced ([x] ++ [y] ++ ys) ([x2] ++ xs)


pair :: Char -> Char -> Bool
pair '[' ']' = True
pair '(' ')' = True
pair '{' '}' = True
pair _ _ = False
