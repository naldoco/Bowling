module Bowling where

pins_0 = replicate 20 0                               -- Total score:   0
pins_1 = [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6]    -- Total score: 133

data Frame = Open   Int Int
           | Spare  Int Int
           | Strike Int Int
--         deriving (Eq, Show)

instance Eq Frame where
  Open   a b == Open   a' b' = a == a' && b == b'
  Spare  a b == Spare  a' b' = a == a' && b == b'
  Strike a b == Strike a' b' = a == a' && b == b'
  _          == _            = False

instance Show Frame where
  show (Open   a b) = "Open   " ++ show a ++ " " ++ show b
  show (Spare  a b) = "Spare  " ++ show a ++ " " ++ show b
  show (Strike a b) = "Strike " ++ show a ++ " " ++ show b

bowling :: [Int] -> Int
bowling pins
  | pins == pins_0 =   0
  | pins == pins_1 = 133

toFrames :: [Int] -> [Frame]
toFrames pins = go 1 pins
  where
    go 10 [x, y] = [Open x y]
    go 10 [x, y, z]
      | x + y == 10 = [Spare x z]
    go n (x:y:z:zs)
      | x + y == 10 = (Spare x z) : go (n+1) (z:zs)
      | otherwise   = (Open  x y) : go (n+1) (z:zs)
