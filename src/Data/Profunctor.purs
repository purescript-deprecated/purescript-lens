module Data.Profunctor where

  class Profunctor p where
    dimap :: forall a b c d. (a -> b) -> (c -> d) -> p b c -> p a d

  lmap :: forall a b c p. (Profunctor p) => (a -> b) -> p b c -> p a c
  lmap a2b = dimap a2b id

  rmap :: forall a b c p. (Profunctor p) => (b -> c) -> p a b -> p a c
  rmap b2c = dimap id b2c

  instance profunctorArr :: Profunctor (->) where
    dimap a2b c2d b2c = a2b >>> b2c >>> c2d
