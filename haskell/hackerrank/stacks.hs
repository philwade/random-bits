import Control.Applicative
import Control.Monad
import System.IO
import Data.Char (isSpace)
import Data.List (foldl')


main :: IO ()
main = do
    q <- getLine
    let instructionCount = read q::Int
    instructions <- getMultipleLines instructionCount
    doInstructions instructions

getMultipleLines :: Int -> IO [String]

getMultipleLines n
    | n <= 0 = return []
    | otherwise = do
        x <- getLine
        xs <- getMultipleLines (n-1)
        let ret = (x:xs)
        return ret

doInstructions :: [String] -> IO ()
doInstructions instructions =
    let (_, _, toPrint) = foldl' parseInstructions ([], [], []) instructions
    in
        forM_ (reverse toPrint) (\value -> putStrLn $ show value)

parseInstructions :: ([Int], [Int], [Int]) -> String -> ([Int], [Int], [Int])
parseInstructions (dequeue, enqueue, toPrint) io_instruction =
    let
       (instruction, value) = parseInstruction io_instruction
    in
        case instruction of
            "1" ->
                case value of
                    Just v -> (dequeue, v : enqueue, toPrint)
                    Nothing -> error "Enqueue instruction without value"
            "2" ->
                let
                    (dequeue2, enqueue2) = dequer dequeue enqueue
                in
                    (tail dequeue2, enqueue2, toPrint)
            "3" ->
                let
                    (dequeue3, enqueue3) = dequer dequeue enqueue
                    printv = head dequeue3
                in
                    (dequeue3, enqueue3, printv : toPrint)

dequer :: [Int] -> [Int] -> ([Int], [Int])
dequer [] enqueue = (reverse enqueue, [])
dequer d e = (d, e)

parseInstruction :: String -> (String, Maybe Int)
parseInstruction [x] = ([x], Nothing)
parseInstruction (x:xs) =
    let
        instruction = x
        value = read (dropWhile isSpace xs)::Int
    in
        ([instruction], Just value)
