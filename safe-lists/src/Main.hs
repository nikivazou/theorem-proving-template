-- NV TODO: These flags should be removed
{-@ LIQUID "--higherorder"    @-}
{-@ LIQUID "--exact-data-con" @-}

module Main where

import Data.List 
import Prelude hiding (length, map, (++))

main :: IO ()
main = do 
  putStrLn "Hello SAFE world!"
  putStrLn "I will safely now apply map fusion..."
  putStrLn (show $ map (+1) (map (*9) (C 1 N ++ C 2 N )))