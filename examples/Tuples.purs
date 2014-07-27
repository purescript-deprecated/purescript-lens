module Examples.Tuples where

  import Control.Lens

  import Debug.Trace

  succ x = x + 1

  main = do
    print $ ("hello" ~ "world")^._2
    print $ (_2.~42) ("hello" ~ "world")
    print $ ("hello" ~ "world" ~ "!!!")^._2.._1
    print $ over _1 succ (1 ~ 2)
