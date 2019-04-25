{-
    This is a playground FOR TEST PURPOSES ONLY. 

    IMPORTANT NOTES:
        - None of this features should be taken as complete, correct or logically sane.
        - This assumes only 2 letter syllables, which is not the reallity.
-}

-- Types
data Message = Message {
    text    :: String,
    script  :: Script
} deriving (Show)

data Script = Hiragana | Katakana | Kanji | Romaji deriving (Eq, Show)

-- Case Format 1
hiragana :: String -> String
hiragana "hi" = "ひ"
hiragana "ra" = "ら"
hiragana "ga" = "が"
hiragana "na" = "な"
hiragana "ka" = "か"
hiragana "ta" = "た"
hiragana "ma" = "ま"
hiragana "su" = "す"
hiragana "fu" = "ふ"

hiragana (a:b:[]) = [a,b]
hiragana (' ':a:b:rest) = " " ++ (hiragana [a,b]) ++ (hiragana rest)
hiragana (a:b:rest) = (hiragana [a,b]) ++ (hiragana rest)
hiragana _ = ""

-- Case Format 2
katakana syllable = case syllable of 
    "hi" -> "ヒ"
    "ra" -> "ラ"
    "ga" -> "ガ"
    "na" -> "ナ"
    "ka" -> "カ"
    "ta" -> "タ"
    "ma" -> "マ"
    "su" -> "ス"
    "fu" -> "フ"

    (a:b:[]) -> [a,b]
    (a:[]) -> ""
    [] -> ""
    (' ':a:b:rest) -> " " ++ (katakana [a,b]) ++ (katakana rest)
    (a:b:rest) -> (katakana [a,b]) ++ (katakana rest)

-- Action: Convert Message
convert :: Message -> Script -> Message
convert (Message text Romaji) to = case to of 
    Hiragana -> Message { text = (hiragana text), script = Hiragana  }
    Katakana -> Message { text = (katakana text), script = Katakana  }
    Kanji    -> Message { text = ((\t -> case t of { "dog" -> "犬"; "person" -> "人"; _ -> "dunno" }  ) text), script = Kanji }      --Lambda expression & inline case


convert (Message text _) _ = Message "TODO: To be done" Romaji

-- 
message1 = Message { text = "hiragana katakana", script = Romaji  } 
message2 = Message "hiragana katakana" Romaji 
--

run romajiText toScript = putStrLn (text (convert (Message romajiText Romaji) toScript))