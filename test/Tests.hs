module Main where

import Test.Tasty
import Test.Tasty.HUnit

import Bowling

pins0 = replicate 20 0                               -- Total score:   0
pins1 = [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6]    -- Total score: 133

bowlingSuite :: TestTree
bowlingSuite =
  testGroup "Bowling tests"
    [ testGroup "Pins"
      [ testCase ("Pins   0 is " ++ (show pins0) ++ "-> total:   0") $
          show (bowling pins0) @?=   "0"
      , testCase ("Pins 133 is " ++ (show pins1) ++ "-> total: 133") $
          show (bowling pins1) @?= "133"
      ]
    , testGroup "toFrames" $
      [ testCase "Zeros are Open 0 0s" $
          toFrames (replicate 20 0) @?= replicate 10 (Open 0 0)
      ]
    , testGroup "toFrames" $
        map (\(label, input, expected) ->
                testCase label $ toFrames input @?= expected) tests
    ]

tests :: [(String, [Int], [Frame])]    -- (label, pins, frames)
tests =
  [ ( "Zeros are Open 0 0"
    , replicate 20 0
    , replicate 10 (Open 0 0)
    )
  ,
    ( "Ones  are Open 1 1"
    , replicate 20 1
    , replicate 10 (Open 1 1)
    )
  ,
    ( "4+5   are Open 4 5"
    , take 20 $ cycle [4,5]
    , replicate 10 (Open 4 5)
    )
  ]

main = defaultMain bowlingSuite
