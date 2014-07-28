module Control.Lens.Traversal where

  import Control.Lens.Internal.Indexed (conjoined{-, indexing-})
  import Control.Lens.Type (IndexedTraversal())

  import Data.Traversable (traverse, Traversable)

  -- traversed :: forall a b f. (Traversable f) => IndexedTraversal Number (f a) (f b) a b
  -- traversed = conjoined traverse (indexing traverse)
