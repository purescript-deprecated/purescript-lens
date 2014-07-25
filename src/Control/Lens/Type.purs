module Control.Lens.Type where

  type Lens s t a b = forall f. (Functor f) => (a -> f b) -> s -> f t
  type LensP s a = Lens s s a a
