module Parser where

import Data.Text.Lazy (Text, pack)
import Language
import Text.Parsec (ParseError, anyToken, many1, parse, string, (<|>))
import Text.Parsec.Text.Lazy

parseToken :: Parser Expr
parseToken = Token <$> parseReseveredWord
  where
    parseReseveredWord :: Parser Text
    parseReseveredWord =
        pack
            <$> ( string "!"
                    <|> string "{"
                    <|> string "}"
                    <|> string "case"
                    <|> string "do"
                    <|> string "done"
                    <|> string "elif"
                    <|> string "else"
                    <|> string "esac"
                    <|> string "fi"
                    <|> string "for"
                    <|> string "if"
                    <|> string "in"
                    <|> string "then"
                    <|> string "until"
                    <|> string "while"
                )

parseWord :: Parser Expr
parseWord = Word . pack <$> many1 anyToken

parseExpr :: Parser Expr
parseExpr = parseToken <|> parseWord

parser :: Text -> Either ParseError Expr
parser = parse parseExpr "wash"
