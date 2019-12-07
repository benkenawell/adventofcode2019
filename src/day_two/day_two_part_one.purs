module AoC.DayTwo where
  
-- import Prelude
import Prelude (($), (<>), (+), (*), show, Unit, bind, discard, map, pure, identity)
import Data.Array (updateAt, drop, index, take)
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
    log $ foldl (\acc a -> acc <> a <> " ") "" $ map show $ startCode $ parseInput "," text

output :: Array Int -> String
output inarr = foldl (\acc a -> acc <> a <> " ") "" $ map show inarr

checkOp :: Array Int -> Maybe (Array Int)
checkOp arr = operation arr arr

startCode :: Array Int -> Array Int
startCode input = newReadOps (pure input) 0

newReadOps :: Maybe (Array Int) -> Int -> Array Int
newReadOps (Just allCode) opIdx =
  case code of
    99 -> allCode
    -- Nothing -> allCode
    _ -> newReadOps (operation allCode [code, op1, op2, updatePos]) (opIdx + 4)
  where
    code :: Int
    code = maybe 0 identity $ index allCode opIdx 
    op1 :: Int
    op1 = maybe 0 identity $ index allCode (opIdx + 1)
    op2 :: Int
    op2 = maybe 0 identity $ index allCode (opIdx + 2)
    updatePos :: Int
    updatePos = maybe 0 identity $ index allCode (opIdx + 3)
newReadOps Nothing _ = []

operation :: Array Int -> Array Int -> Maybe (Array Int)
operation allCode curOp@[code, pos1, pos2, updatePos] = do 
    op1 <- index allCode pos1
    op2 <- index allCode pos2
    updateAt updatePos (opCode code op1 op2) allCode
operation allCode _ = pure allCode

opCode :: Int -> Int -> Int -> Int
opCode 1 y z = y + z
opCode 2 y z = y * z
opCode x y z = 0
