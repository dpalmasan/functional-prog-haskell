import Data.List
import Data.Char


cleanWords :: String -> [String]
cleanWords text =
    cleanedWords
    where
        ws =  words $ map toLower text
        ws' = map (takeWhile isLetter . dropWhile (not . isLetter)) ws
        cleanedWords = filter (not . null) ws'

countUnique :: [String] -> Int
countUnique wordList =
    length $ map head $ group $ sort wordList

main =  do
    print =<< uniqueWords
    where
        text = readFile "inputs/wsj-sample.txt"
        cleanedWords = cleanWords <$> text
        uniqueWords = countUnique <$> cleanedWords

