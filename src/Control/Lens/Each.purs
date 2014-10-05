module Control.Lens.Each where

  import Control.Lens.Type (Traversal())

  import Data.Traversable (traverse)
  import Data.Tuple (Tuple(..))

  class Each s t a b where
    each :: Traversal s t a b

  instance eachTuple :: Each (Tuple a a) (Tuple b b) a b where
    each f (Tuple a b) = Tuple <$> f a <*> f b

  instance eachArray :: Each [a] [b] a b where
    each = traverse
