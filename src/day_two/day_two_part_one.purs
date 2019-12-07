module AoC.DayTwo where
  
-- import Prelude
import Prelude (($), (<>), (+), (*), show, Unit, bind, discard, map, pure, identity)
import Data.Array (updateAt, drop, index)
import Data.Foldable (foldl)
import Data.Maybe (maybe, Maybe(..))
import Effect (Effect)
import Effect.Console (log)
import Node.Encoding (Encoding(UTF8))
import Node.FS.Sync (readTextFile)

import AoC.Util (parseInput)

import Debug.Trace (trace)

dayTwo :: Effect Unit
dayTwo = do
    text <- readTextFile UTF8 "./src/day_two/input.txt"
    -- log $ output $ maybe [] identity $ checkOp $ parseInput "," "1,0,0,0,99"
    log $ output $ startCode $ parseInput "," "1,0,0,0,99"
    log $ output $ startCode $ parseInput "," "2,3,0,3,99"
    log $ output $ startCode $ parseInput "," "2,4,4,5,99,0"
    log $ output $ startCode $ parseInput "," "1,1,1,4,99,5,6,0,99"
    -- log $ foldl (\acc a -> acc <> a <> " ") "" $ map show $ startCode $ parseInput "," text

output :: Array Int -> String
output inarr = foldl (\acc a -> acc <> a <> " ") "" $ map show inarr

checkOp :: Array Int -> Maybe (Array Int)
checkOp arr = operation arr arr

startCode :: Array Int -> Array Int
startCode input = readOps (pure input) input

readOps :: Maybe (Array Int) -> Array Int -> Array Int
readOps (Just allCode) [99, _] = trace ("ending...") \_ -> allCode
readOps (Just allCode) curOp@[code, pos1, pos2, updatePos, _] = trace ("step: " <> (output curOp)) \_ -> readOps (operation allCode curOp) (drop 4 curOp)
readOps (Just allCode) _ = trace "fell through" \_ -> allCode
readOps Nothing _ = trace "nothing" \_ -> []
    

operation :: Array Int -> Array Int -> Maybe (Array Int)
operation allCode curOp@[code, pos1, pos2, updatePos, _] = do 
    op1 <- index allCode pos1
    op2 <- index allCode pos2
    updateAt updatePos (opCode code op1 op2) allCode
operation allCode _ = pure allCode

-- getIndex :: Array Int -> Int -> Int
-- getIndex allCode idx = maybe 0 identity $ index idx allCode

opCode :: Int -> Int -> Int -> Int
opCode 1 x y = x + y
opCode 2 x y = x * y
opCode z x y = 0
-- opCode 99 _ _ =