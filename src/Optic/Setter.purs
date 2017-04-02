module Optic.Setter
  ( (%~), (.~), (+~), (-~), (*~), (/~), (||~), (&&~), (<>~), (?~)
  , argument
  , contramapped
  , mapped
  , over
  , set
  , set'
  , sets
  , add
  , sub
  , mul
  , div
  , or
  , and
  , concat
  , setJust
  ) where

  import Data.Functor.Contravariant ((>$<), class Contravariant)
  import Data.Identity (Identity(..))
  import Data.Maybe (Maybe(..))
  import Data.Newtype (unwrap)
  import Data.Profunctor (lmap, rmap, class Profunctor)

  import Optic.Internal.Setter (taintedDot, untaintedDot, class Settable)
  import Optic.Types (ASetter(), ASetter'(), Optical(), Setter(), Setting())

  import Prelude ( class HeytingAlgebra, class EuclideanRing, class Functor
                 , class Ring, class Semigroup, class Semiring
                 , (+), (-), (*), (/), (||), (&&), (<>), (<<<), (>>>), (<$>)
                 , const, flip
                 )

  infixr 4 over as %~
  infixr 4 set as .~
  infixr 4 add as +~
  infixr 4 sub as -~
  infixr 4 mul as *~
  infixr 4 div as /~
  infixr 4 or as ||~
  infixr 4 and as &&~
  infixr 4 concat as <>~
  infixr 4 setJust as ?~

  argument :: forall p r a b. Profunctor p => Setter (p b r) (p a r) a b
  argument = sets lmap

  contramapped :: forall f a b. Contravariant f => Setter (f a) (f b) b a
  contramapped = sets (>$<)

  mapped :: forall f a b. Functor f => Setter (f a) (f b) a b
  mapped = sets (<$>)

  over :: forall p s t a b. Profunctor p => Setting p s t a b -> p a b -> s -> t
  over pstab pab = unwrap <<< pstab (rmap Identity pab)

  set :: forall s t a b. ASetter s t a b -> b -> s -> t
  set stab b = unwrap <<< stab (Identity <<< const b)

  set' :: forall s a. ASetter' s a -> a -> s -> s
  set' sa a = unwrap <<< sa (Identity <<< const a)

  sets :: forall p q f s t a b. Profunctor p => Profunctor q => Settable f => (p a b -> q s t) -> Optical p q f s t a b
  sets pab2qst = untaintedDot >>> pab2qst >>> taintedDot

  add :: forall s t a. Semiring a => ASetter s t a a -> a -> s -> t
  add staa a = over staa (flip (+) a)

  sub :: forall s t a. Ring a => ASetter s t a a -> a -> s -> t
  sub staa a = over staa (flip (-) a)

  mul :: forall s t a. Semiring a => ASetter s t a a -> a -> s -> t
  mul staa a = over staa (flip (*) a)

  div :: forall s t a. EuclideanRing a => ASetter s t a a -> a -> s -> t
  div staa a = over staa (flip (/) a)

  or :: forall s t a. HeytingAlgebra a => ASetter s t a a -> a -> s -> t
  or staa a = over staa (flip (||) a)

  and :: forall s t a. HeytingAlgebra a => ASetter s t a a -> a -> s -> t
  and staa a = over staa (flip (&&) a)

  concat :: forall s t a. Semigroup a => ASetter s t a a -> a -> s -> t
  concat staa a = over staa (flip (<>) a)

  setJust :: forall s t a b. ASetter s t a (Maybe b) -> b -> s -> t
  setJust stab a = set stab (Just a)
