module Data.Profunctor.Strong where

  import Data.Profunctor (Profunctor)
  import Data.Tuple (Tuple(..))

  class (Profunctor p) <= Strong p where
    first' :: forall a b c. p a b -> p (Tuple a c) (Tuple b c)
    second' :: forall a b c. p b c -> p (Tuple a b) (Tuple a c)

  instance strongArr :: Strong (->) where
    first' a2b (Tuple a c) = Tuple (a2b a) c
    second' = (<$>)
