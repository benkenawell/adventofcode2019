module AoC.DayOne where

import Prelude
import Effect (Effect)
import Effect.Console (log)
import Data.Foldable (foldl)
import Node.Encoding (Encoding(UTF8))
import Node.FS.Sync (readTextFile)

import AoC.Util (parseInput)

-- import Debug.Trace (trace)

dayOne :: Effect Unit
dayOne = do
  -- I think this is the right way to do this since I use it multiple places
  text <- readTextFile UTF8 "./src/day_one/input.txt"
  -- -- -- --
  -- next two lines let me read all the files in the current directory.
  -- I could also probably do this as one line: `log $ foldl (\acc a -> acc <> a) "" $ readdir "."`
  -- files <- readdir "."
  -- log $ foldl (\acc a -> acc <> a) "" files
  -- -- -- --
  -- testing my code when it doesn't work
  -- log $ show $ fuelWeight 0 2
  -- log $ show $ fuel 12
  -- log $ show $ fuelWeight 0 $ fuel 12
  -- -- -- --
  -- Advent of Code practice cases.  Day 2 right now
  -- log $ foldl (\acc str -> acc <> str <> "  ") "" $ map show $ map (fuelWeight 0) $ map fuel [12, 14, 1969, 100756] 
  -- -- -- --
  log $ ("Part 1: " <> _) $ show $ sumFuel $ map fuel $ parseInput "\n" text
  log $ ("Part 2: " <> _) $ show $ sumFuel $ map (fuelWeight 0) $ map fuel $ parseInput "\n" text

-- | sums the entire array
sumFuel :: Array Int -> Int
sumFuel arr = foldl (\acc x -> acc + x) 0 arr

-- | calculates fuel the weight of the fuel needs to take off
fuelWeight :: Int -> Int -> Int
fuelWeight acc x | x <= 0    = acc 
                 | otherwise = fuelWeight (acc + x) (fuel x)

-- used to trace the fuelWeight function.
-- used with `trace (traceFuelWeight acc x) (\_ -> fuelWeight (acc + x) (fuel x))` in the fuelWeight function, as an example
-- traceFuelWeight :: Int -> Int -> String
-- traceFuelWeight acc x = "acc: " <> (show $ acc) <> ", x: " <> (show $ x)

-- | calculates fuel based on a mass
fuel :: Int -> Int
fuel mass | mass > 0  = subtractTwo $ div mass 3
          | otherwise = 0

-- | subtract two from any number, because I was playing around with making functions
subtractTwo :: Int -> Int
subtractTwo = (_ - 2)
