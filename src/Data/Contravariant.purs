module Data.Contravariant where

  class Contravariant f where
    (>$<) :: forall a b. (b -> a) -> f a -> f b
