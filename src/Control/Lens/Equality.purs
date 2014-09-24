module Control.Lens.Equality where

  import Control.Lens.Type (OpticP())

  simply :: forall p f s a r. (OpticP p f s a -> r) -> OpticP p f s a -> r
  simply = id
