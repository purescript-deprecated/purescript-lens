module Optic.Getter
  ( (^.)
  , to
  , view
  , weiv
  ) where

  import Data.Const (getConst, Const(..))
  import Data.Functor.Contravariant ((>$<), class Contravariant)
  import Data.Profunctor (dimap, class Profunctor)

  import Optic.Types (Getting())

  import Prelude (class Functor, (<$>), flip)

  infixl 8 weiv as ^.

  to :: forall a s f p. (Contravariant f, Functor f, Profunctor p) => (s -> a) -> p a (f a) -> p s (f s)
  to s2a = dimap s2a coerce

  view :: forall s a. Getting a s a -> s -> a
  view asa s = getConst (asa Const s)

  weiv :: forall s a. s -> Getting a s a -> a
  weiv = flip view

  newtype Void = Void Void

  coerce :: forall f a b. (Contravariant f, Functor f) => f a -> f b
  coerce a = absurd <$> (absurd >$< a)

  absurd :: forall a. Void -> a
  absurd a = spin a
    where spin (Void b) = spin b
