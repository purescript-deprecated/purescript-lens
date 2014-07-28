module Control.Lens.Indexed
  ( FoldableWithIndex
  , FunctorWithIndex
  , TraversableWithIndex
  , imap
  , ifoldMap
  , itraverse
  , itraversed
  ) where

  import Control.Lens.Internal.Indexed (conjoined, indexed)
  import Control.Lens.Type (IndexedSetter(), IndexedTraversal())

  import Data.Monoid (Monoid)
  import Data.Foldable (Foldable)
  import Data.Traversable (traverse, Traversable)

  class (Functor f) <= FunctorWithIndex i f where
    imap :: forall a b. (i -> a -> b) -> f a -> f b

  class (Foldable f) <= FoldableWithIndex i f where
    ifoldMap :: forall a m. (Monoid m) => (i -> a -> m) -> f a -> m

  class (FunctorWithIndex i t, FoldableWithIndex i t, Traversable t) <= TraversableWithIndex i t where
    itraverse :: forall a b f. (Applicative f) => (i -> a -> f b) -> t a -> f (t b)
    itraversed :: forall a b f. IndexedTraversal i (t a) (t b) a b
