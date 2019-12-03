module Main where

import Prelude
import Effect (Effect)
import Effect.Console (log)
-- Day functions --
import DayOne (dayOne)


main :: Effect Unit
main = do
  log "--- Day 1 --- "
  dayOne