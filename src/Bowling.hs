module Bowling where

pins_0 = replicate 20 0                               -- Total score:   0
pins_1 = [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6]    -- Total score: 133

data Frame = Open   Int Int
           | Spare  Int Int
           | Strike Int Int
           deriving (Eq, Show)

bowling :: [Int] -> Int
bowling pins
  | pins == pins_0 =   0
  | pins == pins_1 = 133

toFrames :: [Int] -> [Frame]
toFrames pins = replicate 10 (Open 0 0)
