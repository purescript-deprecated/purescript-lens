module Optic.Lens
  ( (??)
  , lens
  ) where

import Prelude

import Optic.Types (Lens())

infixl 1 ??

lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b
lens s2a s2b2t a2fb s = s2b2t s <$> a2fb (s2a s)

(??) :: forall f a b. (Functor f) => f (a -> b) -> a -> f b
(??) ff x = (\f -> f x) <$> ff
