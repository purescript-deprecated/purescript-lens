module Example.Control.Lens.Each where

  import Control.Lens

  import Data.String
  import Data.Tuple

  import Debug.Trace

  foo :: [Number]
  foo = [1,2,3] # each +~ 2

  bar :: Tuple Number Number
  bar = ("Hi" ~ "everybody!") # each %~ length

  main = do
    print foo
    print bar
