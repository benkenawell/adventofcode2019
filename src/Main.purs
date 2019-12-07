module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
-- Day functions --
import AoC.DayOne (dayOne)
import AoC.DayTwo (dayTwo)


main :: Effect Unit
main = do
  log "--- Day 1  --- "
  dayOne
  log "--- Day 2  ---"
  dayTwo