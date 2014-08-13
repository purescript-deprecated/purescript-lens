module Control.Lens.Getter
  ( Accessing()
  , Getting()
  , (^.)
  , to
  , use
  , view
  ) where

  infixl 8 ^.

  import Control.Lens.Internal.Indexed (Conjoined)
  import Control.Lens.Type (IndexPreservingGetter(), Optical())
  import Control.Monad.Identity (Identity())
  import Control.Monad.Reader.Class (reader, MonadReader)
  import Control.Monad.State.Class (gets, MonadState)

  import Data.Contravariant ((>$<), Contravariant)
  import Data.Const (getConst, Const(..))
  import Data.Profunctor (dimap, rmap, Profunctor)
  import Data.Tuple (Tuple())

  type Accessing p m s a = p a (Const m a) -> s -> Const m s
  type Getting r s a = (a -> Const r a) -> s -> Const r s

  to :: forall a s f p. (Conjoined p Identity Identity, Contravariant f, Functor f, Profunctor p) => (s -> a) -> p a (f a) -> p s (f s)
  to s2a = dimap s2a coerce

  use :: forall s a m. (Monad m, MonadState s m) => Getting a s a -> m a
  use asa = gets (getConst `rmap` asa Const)

  view :: forall r a m. (Monad m, MonadReader r m) => Getting a r a -> m a
  view ara = reader (getConst `rmap` ara Const)

  (^.) :: forall s a. s -> Getting a s a -> a
  (^.) s asa = getConst (asa Const s)

  newtype Void = Void Void

  coerce :: forall f a b. (Contravariant f, Functor f) => f a -> f b
  coerce a = absurd <$> (absurd >$< a)

  absurd :: forall a. Void -> a
  absurd a = spin a
    where spin (Void b) = spin b
