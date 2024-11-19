module Language where

import Data.Text.Lazy (Text)

data Expr
    = Token Text
    | Word Text
    deriving (Show)
