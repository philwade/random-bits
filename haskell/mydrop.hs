myDrop x xs = if x <= 0 || null xs
    then xs
    else myDrop (x - 1) (tail xs)
