module Control.Lens.Review where

  import Control.Lens.Getter (to, view, Getting())
  import Control.Lens.Internal.Setter (Settable)
  import Control.Lens.Type (Getter(), Optic(), OpticP())
  import Control.Monad.Identity (runIdentity, Identity(..))
  import Control.Monad.Reader.Class (reader, MonadReader)
  import Control.Monad.State.Class (gets, MonadState)

  import Data.Profunctor (dimap, lmap, rmap, Profunctor)
  import Data.Tagged (unTagged, Tagged(..))

  import qualified Data.Bifunctor as B

  type Review s t a b = forall p f. (B.Bifunctor p, Profunctor p, Settable f) => Optic p f s t a b
  type ReviewP t b = Review t t b b
  type AReview s t a b = Optic Tagged Identity s t a b
  type AReviewP t b = AReview t t b b

  infixr 8 ##

  (##) :: forall s t a b. AReview s t a b -> b -> t
  (##) = dimap (Identity >>> Tagged) (unTagged >>> runIdentity)

  re :: forall s t a b. AReview s t a b -> Getter b t
  re stab = to (dimap (Identity >>> Tagged) (unTagged >>> runIdentity) stab)

  reuse :: forall m b a t s. (Monad m, MonadState b m) => AReview s t a b -> m t
  reuse stab = reuses stab id

  reuses :: forall m b r a t s. (Monad m, MonadState b m) => AReview s t a b -> (t -> r) -> m r
  reuses stab t2r =
    gets (dimap (Identity >>> Tagged) (unTagged >>> runIdentity) stab >>> t2r)

  review :: forall m b a t s. (Monad m, MonadReader b m) => AReview s t a b -> m t
  review stab = reviews stab id

  reviews :: forall m b r a t s. (Monad m, MonadReader b m) => AReview s t a b -> (t -> r) -> m r
  reviews stab t2r =
    reader (dimap (Identity >>> Tagged) (unTagged >>> runIdentity) stab >>> t2r)

  unto :: forall p f s t a b. (Profunctor p, B.Bifunctor p, Functor f) => (b -> t) -> Optic p f s t a b
  unto b2t = B.lmap absurd <<< lmap absurd <<< rmap ((<$>) b2t)

  un :: forall p f s a. (Profunctor p, B.Bifunctor p, Functor f) => Getting a s a -> OpticP p f a s
  un = view >>> unto

  newtype Void = Void Void

  absurd :: forall a. Void -> a
  absurd a = spin a
    where spin (Void b) = spin b
