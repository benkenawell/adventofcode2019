module AoC.DayTwo where
  
-- import Prelude
import Prelude (($), (<>), (+), (*), show, Unit, bind, map, identity, pure)
import Data.Array (updateAt, drop, index)
import Data.Foldable (foldl)
import Data.Maybe (maybe, Maybe)
import Effect (Effect)
import Effect.Console (log)
import Node.Encoding (Encoding(UTF8))
import Node.FS.Sync (readTextFile)

import AoC.Util (parseInput)

-- import Debug.Trace (trace)

dayTwo :: Effect Unit
dayTwo = do
    text <- readTextFile UTF8 "./src/day_two/input.txt"
    log $ output $ checkOp $ parseInput "," "1,0,0,0,99"
    -- log $ foldl (\acc a -> acc <> a <> " ") "" $ map show $ startCode $ parseInput "," text

output :: Array Int -> String
output inarr = foldl (\acc a -> acc <> a <> " ") "" $ map show inarr

checkOp :: Array Int -> Array Int
checkOp arr = do
  check <- operation arr arr
  check

startCode :: Array Int -> Array Int
startCode input = readOps input input

readOps :: Array Int -> Array Int -> Array Int
readOps allCode [99, _] = allCode
readOps allCode curOp@[code, pos1, pos2, updatePos, _] = do
    -- op1 <- index allCode pos1
    -- op2 <- index allCode pos2
    -- newAllCode <- updateAt updatePos (opCode code op1 op2) allCode
    newAllCode <- operation allCode curOp
    readOps newAllCode (drop 4 curOp)
readOps allCode curOp = allCode
    
    -- trace (output allCode <> output curOp) (\_ -> readOps (operation allCode curOp) (drop 4 curOp))

operation :: Array Int -> Array Int -> Maybe (Array Int)
operation allCode curOp@[code, pos1, pos2, updatePos, _] = do 
    op1 <- index allCode pos1
    op2 <- index allCode pos2
    updateAt updatePos (opCode code op1 op2) allCode
operation allCode _ = pure allCode

getIndex :: Array Int -> Int -> Int
getIndex allCode idx = maybe 0 identity $ index idx allCode

opCode :: Int -> Int -> Int -> Int
opCode 1 x y = x + y
opCode 2 x y = x * y
opCode z x y = 0
-- opCode 99 _ _ =