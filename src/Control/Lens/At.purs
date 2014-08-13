module Control.Lens.At
  ( Ixed
  , Index()
  , IxValue()
  , ix
  ) where

  import Control.Lens.Setter ((.~))
  import Control.Lens.Type (LensP(), TraversalP())
  import Control.Monad.Identity (Identity(..))

  import Data.Maybe (Maybe(..))
  import Data.Traversable (sequence, traverse)

  import qualified Data.Map as M
  import qualified Data.Set as S

  type Index a b = b
  type IxValue a b = b

  class Contains m a where
    contains :: Index m a -> LensP m Boolean

  instance containsMapK :: (Ord k) => Contains (S.Set k) k where
    contains k f s =
      (\x -> if x then S.insert k s else S.delete k s) <$> f (S.member k s)

  class Ixed m a b where
    ix :: Index m a -> TraversalP m (IxValue m b)

  instance ixedArrEA :: (Eq e) => Ixed (e -> a) e a where
    ix e a2fa e2a = (\a e' -> if e == e' then a else e2a e') <$> a2fa (e2a e)

  instance ixedMaybeUnit :: Ixed (Maybe a) Unit a where
    ix _ _    Nothing  = pure Nothing
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

  instance ixedSetK :: (Ord k) => Ixed (S.Set k) k Unit where
    ix k u2fu setK = if S.member k setK
      then (\_ -> S.insert k setK) <$> u2fu unit
      else pure setK

  class (Ixed m a b) <= At m a b where
    at :: Index m a -> LensP m (Maybe (IxValue m b))

  -- instance atMaybe :: At (Maybe a) Unit a where
  --   at _ a2fa Nothing = a2fa Nothing

  -- sans :: forall b a m. (At m a b) => Index m a -> m -> m
  -- sans i x = x # at i .~ Nothing

  ixAt :: forall b a m. (At m a b) => Index m a -> TraversalP m (IxValue m b)
  ixAt i = traverse >>> at i
