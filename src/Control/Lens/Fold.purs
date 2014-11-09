module Control.Lens.Fold
  ( (^..)
  , (^?)
  , filtered
  , foldlOf
  , foldMapOf
  , foldOf
  , foldrOf
  , has
  , hasn't
  , toListOf
  ) where

  import Control.Lens.Getter (Accessing(), Getting())
  import Control.Lens.Type (OpticP())

  import Data.Const (getConst, Const(..))
  import Data.Either (either, Either(..))
  import Data.Maybe (Maybe(..))
  import Data.Monoid.All (runAll, All(..))
  import Data.Monoid.Any (runAny, Any(..))
  import Data.Monoid.Dual (runDual, Dual(..))
  import Data.Monoid.Endo (runEndo, Endo(..))
  import Data.Monoid.First (runFirst, First(..))
  import Data.Profunctor (dimap, lmap, rmap, Profunctor)
  import Data.Profunctor.Choice (right', Choice)

  infixl 8 ^..
  infixl 8 ^?

  filtered :: forall f a p. (Applicative f, Choice p) => (a -> Boolean) -> OpticP p f a a
  filtered p = dimap (\x -> if p x then Right x else Left x) (either pure id) <<< right'

  foldOf :: forall a s. Getting a s a -> s -> a
  foldOf asa s = getConst $ asa Const s

  foldrOf :: forall r a s p. (Profunctor p) => Accessing p (Endo r) s a -> p a (r -> r) -> r -> s -> r
  foldrOf pErsa par2r r =
    rmap (flip runEndo r) (foldMapOf pErsa (Endo `rmap` par2r))

  foldlOf :: forall r a s. Getting (Dual (Endo r)) s a -> (r -> a -> r) -> r -> s -> r
  foldlOf pErsa par2r r =
    rmap (runDual `lmap` flip runEndo r) (foldMapOf pErsa (Dual `rmap` Endo `rmap` flip par2r))

  foldMapOf :: forall r a s p. (Profunctor p) => Accessing p r s a -> p a r -> s -> r
  foldMapOf prsa par = getConst `rmap` prsa (Const `rmap` par)

  has :: forall a s. Getting Any s a -> s -> Boolean
  has asa s = runAny $ foldMapOf asa (const $ Any true) s

  hasn't :: forall a s. Getting All s a -> s -> Boolean
  hasn't asa s = runAll $ foldMapOf asa (const $ All false) s

  toListOf :: forall a s. Getting (Endo [a]) s a -> s -> [a]
  toListOf easa = foldrOf easa (:) []

  (^..) :: forall a s. s -> Getting (Endo [a]) s a -> [a]
  (^..) = flip toListOf

  (^?) :: forall a s. s -> Getting (First a) s a -> Maybe a
  (^?) s fasa = runFirst $ foldMapOf fasa (First `rmap` Just) s
