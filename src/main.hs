import System.IO  
import Control.Monad

main = do  
	contents <- readFile "0_getting-started.md"
	let contents_list = lines $ contents


	print(foldr test5 "## test" [["##", "<H1>", "</H1>"], ["###", "<H2>", "</H2>"]])


test5 :: [String] -> String -> String
test5 x y = repla x y

twoHash :: String -> String -> String -> String
twoHash startTag str endTag = concat[startTag, str, endTag]

repla :: [String] -> String -> String
repla arr line = 
    if take (length (arr!!0)) line == arr!!0 
    then twoHash (arr!!1) (drop (length (arr!!0) + 1) line) (arr!!2)
    else line

--dict :: [String]
--dict = [["##" , "<H1>", "</H1>"], ["###", "<H2>", "</H2>"]]
