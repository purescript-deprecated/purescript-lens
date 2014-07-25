module Control.Lens.Getter
  ( Const(..)
  , Getting()
  , view
  ) where

  import Control.Lens.Type

  type Getting r s a = (a -> Const r a) -> s -> Const r s

  data Const a b = Const a

  getConst :: forall a b. Const a b ->  a
  getConst (Const x) = x

  instance functorConst :: Functor (Const a) where
    (<$>) _ (Const x) = Const x

  view :: forall a s. Getting a s a -> s -> a
  view asa = getConst <<< asa Const
