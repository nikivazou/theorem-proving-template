{-# LANGUAGE BangPatterns #-}

module Main where

import System.Exit
import System.Process

main :: IO ExitCode
main = runAllLiquid


runAllLiquid :: IO ExitCode
runAllLiquid = mconcat <$> mapM runLiquid orderedSrcFiles  


orderedSrcFiles :: [String]
orderedSrcFiles = [
    "Data/Misc.hs"
  , "Data/List.hs"
  , "Theorems/List.hs"
  , "Main.hs"
  ]

runLiquid :: String -> IO ExitCode
runLiquid fname 
  = runCommand' ("cd " ++ sourceDir ++ "; stack exec -- liquid " ++ fname )

sourceDir :: String
sourceDir = "src"

runCommand' :: String -> IO ExitCode
runCommand' str = 
  do ps <- runCommand (str ++ "> log 2>&1")
     ec <- waitForProcess ps 
     putStrLn ("\nCommand `" ++ str ++ "` exited with " ++ show ec)
     return ec


instance Monoid ExitCode where
  mempty = ExitSuccess
  mappend (ExitFailure i) _ = ExitFailure i 
  mappend ExitSuccess e     = e 