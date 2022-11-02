import System.IO  
import System.Directory
import Control.Monad
import GHC.Read (readSymField)



main = do  
    fileNames <- getDirectoryContents "md"
    contents <- readFile ("md/" ++ head fileNames)

    print contents
    print(foldr iter "### test" table)

table :: [[String]]
table = 
    [
    ["##" , "<H1>", "</H1>"],
    ["###", "<H2>", "</H2>"]
    ]

--  iter :: [a] -> a -> a
--readMD :: String -> IO String
--readMD x = readFile concat["md/", x]

-- When called with the 'foldr' function, calls the
-- 'repl' function with all values in the table
iter :: [String] -> String -> String
iter  = repl

-- Concatenates three strings
ccat :: String -> String -> String -> String
ccat startTag str endTag = concat[startTag, str, endTag]

-- Converts string from markdown to html
repl :: [String] -> String -> String
repl arr line = 
    if take (length (head arr)) line == head arr
    then ccat (arr!!1) (drop (length (head arr)) line) (arr!!2)
    else line