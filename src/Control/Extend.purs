module Control.Extend where

  import Control.Monad.Identity (Identity(..))

  class (Functor w) <= Extend w where
    (=>>) :: forall a b. w a -> (w a -> b) ->  w b

  instance extendIdentity :: Extend Identity where
    (=>>) w f = Identity $ f w
