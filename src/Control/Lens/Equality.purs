module Control.Lens.Equality
  ( simple
  , simply
  ) where

  import Control.Lens.Type (EqualityP(), OpticP())

  simple :: forall a. EqualityP a a
  simple = id

  simply :: forall p f s a r. (OpticP p f s a -> r) -> OpticP p f s a -> r
  simply = id
