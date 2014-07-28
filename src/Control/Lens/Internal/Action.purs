module Control.Lens.Internal.Action where

  import Data.Contravariant (Contravariant)

  class (Contravariant f, Functor f, Monad m) <= Effective m r f where
    effective :: forall a. m r -> f a
    ineffective :: forall a. f a -> m r
