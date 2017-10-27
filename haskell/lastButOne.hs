lastButOne xs = if length xs < 2
    then error "list too small"
    else if length xs == 2
         then head xs
         else lastButOne $ tail xs
