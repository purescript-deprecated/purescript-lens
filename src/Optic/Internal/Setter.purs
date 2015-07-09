module Optic.Internal.Setter where

  import Data.Distributive (Distributive)
  import Data.Identity (runIdentity, Identity(..))
  import Data.Profunctor (rmap, Profunctor)
  import Data.Traversable (Traversable)

  import Prelude (Applicative)

  class (Applicative f, Distributive f, Traversable f) <= Settable f where
    untainted :: forall a. f a -> a
    untaintedDot :: forall a b p. (Profunctor p) => p a (f b) -> p a b
    taintedDot :: forall a b p. (Profunctor p) => p a b -> p a (f b)

  instance settableIdentity :: Settable Identity where
    untainted (Identity x) = x
    untaintedDot = rmap runIdentity
    taintedDot = rmap Identity
