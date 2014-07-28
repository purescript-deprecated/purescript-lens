module Control.Lens.Getter
  ( Accessing()
  , Getting()
  , (^.)
  , use
  , view
  ) where

  infixl 8 ^.

  import Control.Lens.Type (Optical())
  import Control.Monad.Reader.Class (reader, MonadReader)
  import Control.Monad.State.Class (gets, MonadState)

  import Data.Const (getConst, Const(..))
  import Data.Profunctor (Profunctor)
  import Data.Tuple (Tuple())

  type Accessing p m s a = p a (Const m a) -> s -> Const m s
  type Getting r s a = (a -> Const r a) -> s -> Const r s

  view :: forall r a m. (Monad m, MonadReader r m) => Getting a r a -> m a
  view ara = reader (getConst <<< ara Const)

  use :: forall s a m. (Monad m, MonadState s m) => Getting a s a -> m a
  use asa = gets (getConst <<< asa Const)

  (^.) :: forall s a. s -> Getting a s a -> a
  (^.) s asa = getConst (asa Const s)
