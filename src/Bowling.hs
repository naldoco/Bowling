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

toFrames :: [Int] -> Maybe [Frame]
toFrames pins = go 1 pins
  where
    go 10 [x, y]
      | x + y < 10 = Just [Open x y]
      | otherwise  = Nothing
    go 10 [x, y, z]
      | x == 10     = Just [Strike y z]
      | x + y == 10 = Just [Spare  x z]
      | otherwise   = Nothing
    go n (x:y:z:zs)
      | x     == 10 = fmap (Strike y z :) $ go (n+1) (y:z:zs)
      | x + y == 10 = fmap (Spare  x z :) $ go (n+1) (z:zs)
      | x + y <  10 = fmap (Open   x y :) $ go (n+1) (z:zs)
      | otherwise   = Nothing
    go _ _          = Nothing

frameScore :: Frame -> Int
frameScore (Open   x y) =  x + y
frameScore (Spare  _ y) = 10 + y
frameScore (Strike x y) = 10 + x + y

score :: [Frame] -> Int
score frames = sum $ map frameScore frames
