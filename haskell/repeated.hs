repeated []     = []
repeated (x:xs) = if x `elem` xs then x:(repeated xs) else (repeated xs)
