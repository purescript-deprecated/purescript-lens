module Control.Lens.Lens where

  import Control.Lens.Type (Lens())

  lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b
  lens s2a s2b2t a2fb s = s2b2t s <$> a2fb (s2a s)
