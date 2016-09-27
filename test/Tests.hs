module Main where

import Test.Tasty
import Test.Tasty.HUnit

import Bowling

pins0 = replicate 20 0                               -- Total score:   0

bowlingSuite :: TestTree
bowlingSuite =
  testGroup "Bowling tests"
    [ testCase ("Pins   0 is " ++ (show pins0) ++ "-> total:   0") $
        show (bowling pins0) @?=   "0"
    ]
main = defaultMain bowlingSuite
