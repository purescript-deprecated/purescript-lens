module Optic.Internal.Setter where

  import Data.Distributive (class Distributive)
  import Data.Identity (Identity(..))
  import Data.Newtype (unwrap)
  import Data.Profunctor (rmap, class Profunctor)
  import Data.Traversable (class Traversable)

  import Prelude (class Applicative)

  class (Applicative f, Distributive f, Traversable f) <= Settable f where
    untainted :: forall a. f a -> a
    untaintedDot :: forall a b p. Profunctor p => p a (f b) -> p a b
    taintedDot :: forall a b p. Profunctor p => p a b -> p a (f b)

  instance settableIdentity :: Settable Identity where
    untainted (Identity x) = x
    untaintedDot = rmap unwrap
    taintedDot = rmap Identity
