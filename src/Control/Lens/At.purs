module Control.Lens.At
  ( At
  , Contains
  , Ixed
  , Index()
  , IxValue()
  , at
  , contains
  , ix
  ) where

  import Control.Lens.Setter ((.~))
  import Control.Lens.Lens ((<#>))
  import Control.Lens.Type (LensP(), TraversalP())
  import Control.Monad.Identity (Identity(..))

  import Data.Array (delete, elemIndex, snoc, updateAt)
  import Data.Maybe (maybe, Maybe(..))
  import Data.Traversable (sequence, traverse)
  import Data.Tuple (snd)

  import qualified Data.Map as M
  import qualified Data.Set as S
  import qualified Data.StrMap as SM

  type Index a b = b
  type IxValue a b = b

  class Contains m a where
    contains :: Index m a -> LensP m Boolean

  instance containsSetK :: (Ord k) => Contains (S.Set k) k where
    contains k f s =
      (\x -> if x then S.insert k s else S.delete k s) <$> f (S.member k s)

  class Ixed m a b where
    ix :: Index m a -> TraversalP m (IxValue m b)

  instance ixedArrEAEA :: (Eq e) => Ixed (e -> a) e a where
    ix e a2fa e2a = (\a e' -> if e == e' then a else e2a e') <$> a2fa (e2a e)

  instance ixedMaybeAUnitA :: Ixed (Maybe a) Unit a where
    ix _ _    Nothing  = pure Nothing
    ix _ a2fa (Just a) = Just <$> a2fa a

  -- This can't be inferred.
  instance ixedMaybeUnitUnitA :: Ixed (Maybe Unit) Unit a where
    ix _ _    Nothing  = pure Nothing
    ix _ a2fa (Just a) = Just <$> pure a

  instance ixedIdentityAAA :: Ixed (Identity a) Unit a where
    ix _ a2fa (Identity a) = Identity <$> a2fa a

  instance ixedArrayaNumberA :: Ixed [a] Number a where
    ix n _    as | n < 0 = pure as
    ix _ _    []         = pure []
    ix 0 a2fa (a:as)     = flip (:) as <$> a2fa a
    ix n a2fa (a:as)     = (:) a <$> ix (n - 1) a2fa as

  instance ixedMapKVKV :: (Ord k) => Ixed (M.Map k v) k v where
    ix k v2fv mapKV = case M.lookup k mapKV of
      Nothing  -> pure mapKV
      (Just v) -> v2fv v <#> \v' -> M.insert k v' mapKV

  instance ixedSetKKUnit :: (Ord k) => Ixed (S.Set k) k Unit where
    ix k u2fu setK = if S.member k setK
      then (\_ -> S.insert k setK) <$> u2fu unit
      else pure setK

  instance ixedStrMapStringV :: Ixed (SM.StrMap v) String v where
    ix str v2fv strMapV = case SM.lookup str strMapV of
      Nothing  -> pure strMapV
      (Just v) -> v2fv v <#> \v' -> SM.insert str v' strMapV

  class (Ixed m a b) <= At m a b where
    at :: Index m a -> LensP m (Maybe (IxValue m b))

  instance atMaybe :: At (Maybe a) Unit a where
    at _ a2fa = a2fa

  instance atMapKVKV :: (Ord k) => At (M.Map k v) k v where
    at k a2fa mapKV = go <$> a2fa mapKV'
      where
        mapKV' = M.lookup k mapKV
        go Nothing  = maybe mapKV (const $ M.delete k mapKV) mapKV'
        go (Just v) = M.insert k v mapKV

  instance atSetKKUnit :: (Ord k) => At (S.Set k) k Unit where
    at k a2fa setK = go <$> a2fa setK'
      where
        setK' = if S.member k setK then Just unit else (Nothing :: Maybe Unit)
        go Nothing  = maybe setK (const $ S.delete k setK) setK'
        go (Just _) = S.insert k setK

  instance atStrMapV :: At (SM.StrMap v) String v where
    at str a2fa strMapV = go <$> a2fa strMapV'
      where
        strMapV' = SM.lookup str strMapV
        go Nothing  = maybe strMapV (const $ SM.delete str strMapV) strMapV'
        go (Just v) = SM.insert str v strMapV

  -- We can't actually do this since the b isn't inferred.
  -- sans :: forall b a m. (At m a b) => Index m a -> m -> m
  -- sans i x = x # at i .~ Nothing

  ixAt :: forall b a m. (At m a b) => Index m a -> TraversalP m (IxValue m b)
  ixAt i = traverse >>> at i
