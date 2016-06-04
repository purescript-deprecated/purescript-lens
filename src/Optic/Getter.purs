module Optic.Getter
  ( (^.)
  , to
  , view
  , weiv
  ) where

  import Data.Const (getConst, Const(..))
  import Data.Functor.Contravariant (class Contravariant, coerce)
  import Data.Profunctor (class Profunctor, dimap)

  import Optic.Types (Getting())

  import Prelude (class Functor, flip)

  infixl 8 weiv as ^.

  to :: forall a s f p. (Contravariant f, Functor f, Profunctor p) => (s -> a) -> p a (f a) -> p s (f s)
  to s2a = dimap s2a coerce

  view :: forall s a. Getting a s a -> s -> a
  view asa s = getConst (asa Const s)

  weiv :: forall s a. s -> Getting a s a -> a
  weiv = flip view
