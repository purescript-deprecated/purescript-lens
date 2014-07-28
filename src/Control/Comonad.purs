module Control.Comonad where

  import Control.Extend (Extend)
  import Control.Monad.Identity (runIdentity, Identity())

  class (Extend w) <= Comonad w where
    extract :: forall a. w a -> a

  instance extendComonad :: Comonad Identity where
    extract = runIdentity
