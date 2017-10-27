inp = "aanncccccccccdddddhjklllllllooooooooooooooottttyyuuiiipppxxxxxdfdnnnmmmmmmm"

summer = makeSum . sums []

takeSame :: ([Char], [Char]) -> ([Char], [Char])
takeSame (set, (x:[])) = (x:set, [])
takeSame (set, (x:x2:[])) =
        if x == x2 then
            (x:x2:set, [])
        else
            (x:set, [x2])
takeSame (set, (x:x2:xs)) =
        let
           newSet = x:set
        in
           if x == x2 then
                takeSame (newSet, [x2] ++ xs)
           else
                (newSet, [x2] ++ xs)

sums :: [Int] -> [Char] -> [Int]
sums set [] = set
sums set str =
    let
        (start, rest) = takeSame ([], str)
    in
        sums ((length start) : set) rest

calcValue :: Int -> Int -> Int
calcValue x acc =
            if x > 8 then
                x * 2 + acc
            else
                if x > 3 then
                    x + acc
                else
                    0 + acc

makeSum :: [Int] -> Int
makeSum set = foldr calcValue 0 set
