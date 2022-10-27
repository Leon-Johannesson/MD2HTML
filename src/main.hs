import System.IO  
import Control.Monad

main = do  
	contents <- readFile "test.txt"
	print(words $ contents)
	print(lines $ contents)

readInt :: String -> Int
readInt = read
