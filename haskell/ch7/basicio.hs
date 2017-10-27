main = do
       putStrLn "hi, what's your name?"
       inputStr <- getLine
       putStrLn $ "Hello, " ++ inputStr
