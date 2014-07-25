module Control.Lens.Getter
  ( Getting()
  , (^.)
  , view
  ) where

  infixl 8 ^.

  import Control.Monad.Reader.Class (reader, MonadReader)

  import Data.Const (getConst, Const(..))

  type Accessing p m s a = p a (Const m a) -> s -> Const m s
  type Getting r s a = (a -> Const r a) -> s -> Const r s

  view :: forall s a m. (Monad m, MonadReader s m) => Getting a s a -> m a
  view asa = reader (getConst <<< asa Const)

  (^.) :: forall s a. s -> Getting a s a -> a
  (^.) s asa = getConst (asa Const s)
