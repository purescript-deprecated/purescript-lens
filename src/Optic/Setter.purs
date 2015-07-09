module Optic.Setter
  ( (%~), (.~), (+~), (-~), (*~), (//~), (||~), (&&~), (<>~), (++~), (?~)
  , argument
  , contramapped
  , mapped
  , over
  , set
  , set'
  , sets
  ) where

  import Data.Functor.Contravariant ((>$<), Contravariant)
  import Data.Identity (runIdentity, Identity(..))
  import Data.Maybe (Maybe(..))
  import Data.Profunctor (lmap, rmap, Profunctor)

  import Optic.Internal.Setter (taintedDot, untaintedDot, Settable)
  import Optic.Types (ASetter(), ASetterP(), Optical(), Setter(), Setting())

  import Prelude ( BooleanAlgebra, DivisionRing, Functor, Ring, Semigroup
                 , Semiring
                 , (+), (-), (*), (/), (||), (&&), (<>), (++), (<<<), (<$>)
                 , (>>>)
                 , const, flip
                 )

  infixr 4 %~
  infixr 4 .~
  infixr 4 +~
  infixr 4 -~
  infixr 4 *~
  infixr 4 //~
  infixr 4 ||~
  infixr 4 &&~
  infixr 4 <>~
  infixr 4 ++~
  infixr 4 ?~

  argument :: forall p r a b. (Profunctor p) => Setter (p b r) (p a r) a b
  argument = sets lmap

  contramapped :: forall f a b. (Contravariant f) => Setter (f a) (f b) b a
  contramapped = sets (>$<)

  mapped :: forall f a b. (Functor f) => Setter (f a) (f b) a b
  mapped = sets (<$>)

  over :: forall p s t a b. (Profunctor p) => Setting p s t a b -> p a b -> s -> t
  over pstab pab = runIdentity <<< pstab (rmap Identity pab)

  set :: forall s t a b. ASetter s t a b -> b -> s -> t
  set stab b = runIdentity <<< stab (Identity <<< const b)

  set' :: forall s a. ASetterP s a -> a -> s -> s
  set' sa a = runIdentity <<< sa (Identity <<< const a)

  sets :: forall p q f s t a b. (Profunctor p, Profunctor q, Settable f) => (p a b -> q s t) -> Optical p q f s t a b
  sets pab2qst = untaintedDot >>> pab2qst >>> taintedDot

  -- Line noise time.

  (%~) :: forall p s t a b. (Profunctor p) => Setting p s t a b -> p a b -> s -> t
  (%~) = over

  (.~) :: forall s t a b. ASetter s t a b -> b -> s -> t
  (.~) = set

  (+~) :: forall s t a. (Semiring a) => ASetter s t a a -> a -> s -> t
  (+~) staa a = over staa (flip (+) a)

  (-~) :: forall s t a. (Ring a) => ASetter s t a a -> a -> s -> t
  (-~) staa a = over staa (flip (-) a)

  (*~) :: forall s t a. (Semiring a) => ASetter s t a a -> a -> s -> t
  (*~) staa a = over staa (flip (*) a)

  (//~) :: forall s t a. (DivisionRing a) => ASetter s t a a -> a -> s -> t
  (//~) staa a = over staa (flip (/) a)

  (||~) :: forall s t a. (BooleanAlgebra a) => ASetter s t a a -> a -> s -> t
  (||~) staa a = over staa (flip (||) a)

  (&&~) :: forall s t a. (BooleanAlgebra a) => ASetter s t a a -> a -> s -> t
  (&&~) staa a = over staa (flip (&&) a)

  (<>~) :: forall s t a. (Semigroup a) => ASetter s t a a -> a -> s -> t
  (<>~) staa a = over staa (flip (<>) a)

  (++~) :: forall s t a. (Semigroup a) => ASetter s t a a -> a -> s -> t
  (++~) staa a = over staa (flip (++) a)

  (?~) :: forall s t a b. ASetter s t a (Maybe b) -> b -> s -> t
  (?~) stab a = set stab (Just a)
