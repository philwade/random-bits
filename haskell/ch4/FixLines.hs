import System.Environment (getArgs)

interactWith function inputFile outputFile = do
    input <- readFile inputFile
    writeFile outputFile (function input)

main = mainWith myFunction
    where mainWith function = do
            args <- getArgs
            case args of
                [input, output] -> interactWith function input output
                _ -> putStrLn "error: exactly two arguments needed"

myFunction = fixLines


splitLines :: String -> [String]
splitLines [] = []
splitLines cs =
    let (pre, suf) = break isLineTerminator cs
    in pre : case suf of
        ('\r':'\n':rest) -> splitLines rest
        ('\r':rest) -> splitLines rest
        ('\n':rest) -> splitLines rest
        _ -> []

isLineTerminator c = c == '\r' || c == '\n'

getWords :: [String] -> [String]
getWords (x:[]) = [head (words x)]
getWords (x:xs) = [head (words x)] ++ getWords xs


fixLines :: String -> String
fixLines input = unlines (getWords (splitLines input))