module Control.Lens.Traversal
  ( both
  , forOf
  , sequenceOf
  , traverseOf
  ) where

  import Control.Lens.Internal.Indexed (conjoined{-, indexing-})
  import Control.Lens.Type (IndexedTraversal(), LensLike(), Over(), Traversal())

  import Data.Traversable (traverse, Traversable)
  import Data.Bitraversable (bitraverse, Bitraversable)

  -- traversed :: forall a b f. (Traversable f) => IndexedTraversal Number (f a) (f b) a b
  -- traversed = conjoined traverse (indexing traverse)

  forOf :: forall p f s t a b. Over p f s t a b -> s -> p a (f b) -> f t
  forOf = flip

  sequenceOf :: forall p f s t a b. LensLike f s t (f b) b -> s -> f t
  sequenceOf l = l id

  traverseOf :: forall p f s t a b. Over p f s t a b -> p a (f b) -> s -> f t
  traverseOf = id

  both :: forall b a r. (Bitraversable r) => Traversal (r a a) (r b b) a b
  both f = bitraverse f f
