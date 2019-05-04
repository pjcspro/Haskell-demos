{-
    This is a playground FOR TEST PURPOSES ONLY. 

    IMPORTANT NOTES:
        - None of this features should be taken as complete, correct or logically sane.
        - These are UNSAFE METHODS which do no handle incorrect inputs
    
-}

-- String to double
stod text = read text :: Double

-- Char to double
ctod :: Char -> Double
ctod c = stod [c]

-- Doube to String
dtos num = show num

-- increase 3 to number
handleNum number = number + 3

-- add $ at the end of a string
handleStr string = string ++ "$"


text = "333.2"

-- All of these are equivalents
runA = handleStr (dtos (handleNum (stod text)))
runB = handleStr $ dtos $ handleNum $ stod text
runC = handleStr . dtos . handleNum . stod $ text


------
f1 :: Char -> Double
f1 '.'  = 0
f1 char = ctod char + 1

runD :: String -> [Double]
runD value = map f1 value

------
f2 :: Char -> Maybe Double
f2 '.' = Nothing
f2 char = Just (ctod char + 1)

runE :: String -> [Maybe Double]
runE value = map f2 value

------
f3 :: Int -> Int -> Int
f3 c1 c2 = c1 + c2

runF = foldl f3 1 [1,2,3]

------
f4 :: String -> String -> String
f4 s1 s2 = s1 ++ s2

runG = foldl f4 "-->" ["abc", "def", "ghi"]
runH = foldr f4 "-->" ["abc", "def", "ghi"]