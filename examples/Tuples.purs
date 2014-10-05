module Examples.Control.Lens.Tuples where

  import Control.Lens

  import Debug.Trace

  succ x = x + 1

  main = do
    print $ ("hello" ~ "world")^._2 -- "world"
    print $ (_2.~42) ("hello" ~ "world") -- Tuple ("hello") (42)
    print $ ("hello" ~ "world" ~ "!!!")^._2.._1 -- "world"
    print $ over _1 succ (1 ~ 2) -- Tuple (2) (2)
