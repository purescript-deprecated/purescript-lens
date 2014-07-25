module Control.Lens.Internal.Setter where

  import Control.Lens.Type
  import Control.Monad.Identity

  import Data.Distributive
  import Data.Foldable
  import Data.Monoid
  import Data.Traversable

  class (Applicative f, Distributive f, Traversable f) <= Settable f where
    untainted :: forall a. f a -> a

  instance settableIdentity :: Settable Identity where
    untainted (Identity x) = x

  -- Move these orphan instances to the appropriate places.

  instance foldableIdentity :: Foldable Identity where
    foldr f z (Identity x) = x `f` z
    foldl f z (Identity x) = z `f` x
    foldMap f (Identity x) = f x

  instance traversableIdentity :: Traversable Identity where
    traverse a2mb (Identity x) = Identity <$> a2mb x
    sequence (Identity mx) = Identity <$> mx
