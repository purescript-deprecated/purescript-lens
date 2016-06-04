module Optic.Lens
  ( (??)
  , lens
  , flip'
  ) where

  import Optic.Types (Lens())

  import Prelude (class Functor, (<$>))

  infixl 1 flip' as ??

  lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b
  lens s2a s2b2t a2fb s = s2b2t s <$> a2fb (s2a s)

  flip' :: forall f a b. Functor f => f (a -> b) -> a -> f b
  flip' ff x = (\f -> f x) <$> ff
