module Data.Tagged where

  import Control.Biapply (Biapply)
  import Control.Biapplicative (Biapplicative)
  import Control.Comonad (Comonad)
  import Control.Extend (Extend)

  import Data.Bifoldable (Bifoldable)
  import Data.Bifunctor (bimap, Bifunctor)
  import Data.Bitraversable (bitraverse, Bitraversable)
  import Data.Either (Either(..))
  import Data.Foldable (Foldable)
  import Data.Monoid (mempty, Monoid)
  import Data.Profunctor (Profunctor)
  import Data.Profunctor.Choice (Choice)
  import Data.Traversable (Traversable)

  newtype Tagged s b = Tagged b

  unTagged :: forall s b. Tagged s b -> b
  unTagged (Tagged x) = x

  retag :: forall s t b. Tagged s b -> Tagged t b
  retag (Tagged x) = Tagged x

  untag :: forall s b. Tagged s b -> b
  untag = unTagged

  tagSelf :: forall b. b -> Tagged b b
  tagSelf = Tagged

  untagSelf :: forall b. Tagged b b -> b
  untagSelf = unTagged

  instance functorTagged :: Functor (Tagged s) where
    (<$>) f (Tagged x) = Tagged $ f x

  instance applyTagged :: Apply (Tagged s) where
    (<*>) (Tagged f) (Tagged x) = Tagged $ f x

  instance bindTagged :: Bind (Tagged s) where
    (>>=) (Tagged x) f = f x

  instance applicativeTagged :: Applicative (Tagged s) where
    pure = Tagged

  instance monadTagged :: Monad (Tagged s)

  instance extendTagged :: Extend (Tagged s) where
    (<<=) f x = Tagged $ f x

  instance comonadTagged :: Comonad (Tagged s) where
    extract = unTagged

  instance semigroupTagged :: (Semigroup b) => Semigroup (Tagged s b) where
    (<>) (Tagged x) (Tagged y) = Tagged $ x <> y

  instance monoidTagged :: (Monoid b) => Monoid (Tagged s b) where
    mempty = Tagged $ mempty

  instance semigroupoidTagged :: Semigroupoid Tagged where
    (<<<) (Tagged x) _ = Tagged x

  instance foldableTagged :: Foldable (Tagged s) where
    foldr f z (Tagged x) = f x z
    foldl f z (Tagged x) = f z x
    foldMap f (Tagged x) = f x

  instance traversableTagged :: Traversable (Tagged s) where
    traverse f (Tagged x) = Tagged <$> f x
    sequence (Tagged x) = Tagged <$> x

  instance bifunctorTagged :: Bifunctor Tagged where
    bimap _ f (Tagged x) = Tagged $ f x

  instance biapplyTagged :: Biapply Tagged where
    (<<*>>) (Tagged f) (Tagged x) = Tagged $ f x

  instance biapplicativeTagged :: Biapplicative Tagged where
    bipure _ = Tagged

  instance bifoldableTagged :: Bifoldable Tagged where
    bifoldr _ f z (Tagged x) = f x z
    bifoldl _ f z (Tagged x) = f z x
    bifoldMap _ f (Tagged x) = f x

  instance bitraversableTagged :: Bitraversable Tagged where
    bitraverse _ f (Tagged x) = Tagged <$> f x
    bisequence (Tagged x) = Tagged <$> x

  instance profunctorTagged :: Profunctor Tagged where
    dimap _ f (Tagged x) = Tagged $ f x

  instance choiceTagged :: Choice Tagged where
    left'  (Tagged x) = Tagged $ Left x
    right' (Tagged x) = Tagged $ Right x
