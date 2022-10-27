import System.IO  
import Control.Monad

main = do  
	contents <- readFile "0_getting-started.md"

	print . map (test0 "##") . lines $ contents 

test0 :: String -> String -> String
test0 match s = if take 2 s == match then "AYO" else s
