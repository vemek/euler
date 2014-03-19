{-
 - Take the number 192 and multiply it by each of 1, 2, and 3:
 - 192 × 1 = 192
 - 192 × 2 = 384
 - 192 × 3 = 576
 -
 - By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
 -
 - The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
 -
 - What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?
 -}

import Data.List

isPandigital :: String -> Bool
isPandigital xs = sort xs == "123456789"

isTooLong xs = length xs > 9

strFromProducts xs = foldl1 (++) xs

allPandigitals :: (Num a, Show a) => a -> [String]
allPandigitals n = allPandigitals' n 1 "" []

allPandigitals' :: (Num a, Show a) => a -> a -> String -> [String] -> [String]
allPandigitals' n step prevStr pans =
  if isTooLong fullStr then pans else allPandigitals' n (step + 1) fullStr pans'
  where fullStr =  prevStr ++ (show $ n * step)
        pans' = if isPandigital fullStr then fullStr:pans else pans
--        pans' = if isPandigital fullStr then (fullStr ++ "|" ++ (show n) ++ "|" ++ (show step)):pans else pans

main :: IO ()
main = do
  let pandigitals = concat $ map allPandigitals [2..9999999]
  putStrLn "Result: "
  mapM_ putStrLn (sort pandigitals)

