module Examples.Control.Lens.At where

  import Control.Lens

  import Data.Maybe

  import Debug.Trace

  import qualified Data.StrMap as SM

  foo = SM.fromList ["foo" ~ 2, "bar" ~ 3]

  main = do
    print "Removing `foo`"
    print (foo # at "foo" .~ (Nothing :: Maybe Number))
    print "Inserting `baz`"
    print (foo # at "baz" ?~ 5)
