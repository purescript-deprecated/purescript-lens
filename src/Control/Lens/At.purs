module Control.Lens.At
  ( Ixed
  , Index()
  , IxValue()
  , ix
  ) where

  import Control.Lens.Type (TraversalP())
  import Control.Monad.Identity (Identity(..))

  import Data.Maybe (Maybe(..))
  import Data.Traversable (sequence)

  import qualified Data.Map as M

  type Index a b = b
  type IxValue a b = b

  class Ixed m a b where
    ix :: Index m a -> TraversalP m (IxValue m b)

  instance ixedArrEA :: (Eq e) => Ixed (e -> a) e a where
    ix e a2fa e2a = (\a e' -> if e == e' then a else e2a e') <$> a2fa (e2a e)

  instance ixedMaybeUnit :: Ixed (Maybe a) Unit a where
    ix _ _ Nothing  = pure Nothing
    ix _ a2fa (Just a) = Just <$> a2fa a

  instance ixedIdentityAA :: Ixed (Identity a) Unit a where
    ix _ a2fa (Identity a) = Identity <$> a2fa a

  instance ixedArrayNumberA :: Ixed [a] Number a where
    ix n _    as | n < 0 = pure as
    ix _ _    []         = pure []
    ix 0 a2fa (a:as)     = flip (:) as <$> a2fa a
    ix n a2fa (a:as)     = (:) a <$> ix (n - 1) a2fa as

  instance ixedMapKV :: (Ord k) => Ixed (M.Map k v) k v where
    ix k v2fv mapKV = case M.lookup k mapKV of
      Nothing  -> pure mapKV
      (Just v) -> (\v' -> M.insert k v' mapKV) <$> v2fv v
