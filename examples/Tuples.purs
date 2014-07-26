module Examples.Tuples where

  import Control.Lens
  import Control.Lens.Type

  import Data.Tuple

  import Debug.Trace

  main = do
    print ((Tuple "hello" "world")^._2)
    print ((_2.~42) (Tuple "hello" "world"))
    print ((Tuple "hello" (Tuple "world" "!!!"))^._2.._1)
