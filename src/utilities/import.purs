module AoC.Util where

import Prelude (($), map, identity)
import Data.Maybe (maybe)
import Data.Int (fromString)
import Data.String (split)
import Data.String.Pattern (Pattern(..))

-- | converts the input file into an array of integers (split by new line)
parseInput :: String -> String -> Array Int
parseInput sep input = map toCode $ split (Pattern sep) input

-- converts the mass string to an integer, setting it to zero if it isn't a number
-- (I have a feeling the last line is returning Nothing)
toCode :: String -> Int
toCode x = maybe 0 identity $ fromString x