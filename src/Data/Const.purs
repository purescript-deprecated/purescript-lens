module Data.Const where

  import Data.Contravariant

  data Const a b = Const a

  getConst :: forall a b. Const a b ->  a
  getConst (Const x) = x

  instance eqConst :: (Eq a) => Eq (Const a b) where
    (==) (Const x) (Const y) = x == y

    (/=) c         c'        = not (c == c')

  instance showConst :: (Show a) => Show (Const a b) where
    show (Const x) = show x

  instance ordConst :: (Ord a) => Ord (Const a b) where
    compare (Const x) (Const y) = compare x y

  instance functorConst :: Functor (Const a) where
    (<$>) _ (Const x) = Const x

  instance contravariantConst :: Contravariant (Const a) where
    (>$<) _ (Const x) = Const x
