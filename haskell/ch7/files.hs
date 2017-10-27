import System.IO
import Data.Char(toUpper, toLower)

main :: IO ()
main = do
       inh <- openFile "input.txt" ReadMode
       outh <- openFile "output.txt" WriteMode
       mainloop inh outh
       hClose inh
       hClose outh

mainloop :: Handle -> Handle -> IO ()
mainloop inh outh =
    do ineof <- hIsEOF inh
       if ineof
          then return ()
          else do inpStr <- hGetLine inh
                  hPutStrLn outh (coolText inpStr)
                  mainloop inh outh

coolText :: String -> String
coolText line =
   let
        indexed = zip [0..] line
   in
        foldl (\acc (i, v) -> if i `mod` 2 == 0 then acc ++ [(toUpper v)] else acc ++ [toLower v]) [] indexed
