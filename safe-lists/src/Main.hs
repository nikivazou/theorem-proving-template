{-@ LIQUID "--higherorder"    @-}
{-@ LIQUID "--exact-data-con" @-}

module Main where

import Data.List 
import Prelude hiding (length, map, (++))

main :: IO ()
main = do 
  putStrLn "Hello SAFE world!"
  putStrLn (show $ map (+1) (C 1 N ++ C 2 N ))