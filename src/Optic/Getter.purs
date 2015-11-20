module Optic.Getter
  ( (^.)
  , to
  , view
  ) where

  infixl 8 ^.

  import Data.Const (getConst, Const(..))
  import Data.Functor.Contravariant ((>$<), Contravariant)
  import Data.Profunctor (dimap, Profunctor)

  import Optic.Types (Getting())

  import Prelude (Functor, (<$>))

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
