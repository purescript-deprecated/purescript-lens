module Optic.Getter
  ( (^.)
  , to
  , view
  ) where

  infixl 8 ^.

  import Optic.Type (Getting())

  import Data.Contravariant ((>$<), Contravariant)
  import Data.Const (getConst, Const(..))
  import Data.Profunctor (dimap, rmap, Profunctor)
  import Data.Tuple (Tuple())

  to :: forall a s f p. (Contravariant f, Functor f, Profunctor p) => (s -> a) -> p a (f a) -> p s (f s)
  to s2a = dimap s2a coerce

  view :: forall s a. Getting a s a -> s -> a
  view asa s = getConst (asa Const s)

  (^.) :: forall s a. s -> Getting a s a -> a
  (^.) s asa = getConst (asa Const s)

  newtype Void = Void Void

  coerce :: forall f a b. (Contravariant f, Functor f) => f a -> f b
  coerce a = absurd <$> (absurd >$< a)

  absurd :: forall a. Void -> a
  absurd a = spin a
    where spin (Void b) = spin b
