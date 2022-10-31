import System.IO
import Control.Monad
import Data.String
import Distribution.Compat.CharParsing (CharParsing(char))

main = do
    contents <- readFile "0_getting-started.md"
    let tags = ["##", "###"]
    let contents_list = lines contents

    let test = map (repl "###" "<H2>" "</H2>") contents_list
    print(map (repl . mapList tags "<H1>" "</H1>") contents_list)


twoHash :: String -> String -> String -> String
twoHash startTag str endTag = concat[startTag, str, endTag]

repl :: String -> String -> String -> String -> String
repl match beg end line = if take (length match) line == match 
 then twoHash beg (drop (length match + 1) line) end else line

mapList :: [String] -> string
mapList  = for 

-- For loop genom Lines av contents   -- Kolla vad den börjar med, hur? t.ex en egen variabel check med en function, hur? idk
-- Därifrån välj vilken tag, klar.