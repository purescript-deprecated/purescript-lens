module Control.Lens.Getter
  ( Getting()
  , view
  ) where

  import Data.Const (getConst, Const(..))

  type Getting r s a = (a -> Const r a) -> s -> Const r s

  view :: forall a s. Getting a s a -> s -> a
  view asa = getConst <<< asa Const
