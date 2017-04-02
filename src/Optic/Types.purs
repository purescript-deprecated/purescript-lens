module Optic.Types where

  import Data.Const (Const())
  import Data.Functor.Contravariant (class Contravariant)
  import Data.Identity (Identity())
  import Data.Profunctor.Choice (class Choice)

  import Optic.Internal.Prism (Market())
  import Optic.Internal.Setter (class Settable)

  import Prelude (class Applicative, class Functor)

  type Accessing p m s a = p a (Const m a) -> s -> Const m s

  type APrism s t a b = Market a b a (Identity b) -> Market a b s (Identity t)
  type APrism' s a = APrism s s a a

  type ASetter s t a b = (a -> Identity b) -> s -> Identity t
  type ASetter' s a = ASetter s s a a

  type Getting r s a = (a -> Const r a) -> s -> Const r s

  type Getter s a = forall f. Contravariant f => Functor f => (a -> f a) -> s -> f s

  type Lens s t a b = forall f. Functor f => (a -> f b) -> s -> f t
  type Lens' s a = Lens s s a a

  type Optical p q f s t a b = p a (f b) -> q s (f t)
  type Optical' p q f s a = Optical p q f s s a a

  type Prism s t a b = forall f p. Applicative f => Choice p => p a (f b) -> p s (f t)
  type Prism' s a = Prism s s a a

  type Setter s t a b = forall f. Settable f => (a -> f b) -> s -> f t
  type Setter' s a = Setter s s a a

  type Setting p s t a b = p a (Identity b) -> s -> Identity t
  type Setting' p s a = Setting p s s a a
