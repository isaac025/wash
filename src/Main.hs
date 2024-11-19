module Main where

import Control.Monad (when)
import Data.Text.Lazy.IO (getLine, putStr)
import Parser
import System.Environment (getArgs)
import System.Exit (exitSuccess)
import System.IO (BufferMode (..), hSetBuffering, stdout)
import Prelude hiding (getLine, putStr, putStrLn)

washLoop :: IO ()
washLoop = hSetBuffering stdout NoBuffering >> loop
  where
    loop = do
        putStr "> "
        l <- getLine
        when (l == "exit") exitSuccess
        print $ parser l
        loop

washFile :: FilePath -> IO ()
washFile _ = undefined

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] -> washLoop
        (f : _) -> washFile f
