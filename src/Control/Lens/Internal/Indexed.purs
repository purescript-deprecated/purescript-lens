module Control.Lens.Internal.Indexed where

  import Control.Arrow.ArrowApply (ArrowApply)
  import Control.Arrow.ArrowChoice (ArrowChoice)
  import Control.Arrow.ArrowLoop (ArrowLoop)
  import Control.Monad.Identity (runIdentity, Identity(..))
  import Control.Comonad (Comonad)

  import Data.Distributive (Distributive)
  import Data.Foldable (Foldable)
  import Data.Profunctor.Choice (Choice)
  import Data.Profunctor.Rep (Corepresentable, Representable)
  import Data.Profunctor.Strong (Strong)
  import Data.Traversable (Traversable)

  -- FIXME: Still need to implement `MonadFix` and `ArrowLoop`
  -- before this is actually an okay thing.
  class ( Choice p, Corepresentable p f, Comonad f, Traversable f
        , Strong p, Representable p g, Monad g{-, MonadFix g-}, Distributive g
        {-, ArrowLoop p-}, ArrowChoice p, ArrowApply p
        ) <= Conjoined p f g where
    distrib :: forall a b h. (Functor h) => p a b -> p (h a) (h b)
    conjoined :: forall a b q r. (q (a -> b) r) -> q (p a b) r -> q (p a b) r

  instance conjoinedArr :: Conjoined (->) Identity Identity where
    distrib = (<$>)
    conjoined _ qa2br = qa2br

  instance traversableIdentity :: Traversable Identity where
    traverse a2mb (Identity a) = Identity <$> a2mb a
    sequence (Identity ma) = Identity <$> ma

  instance foldableIdentity :: Foldable Identity where
    foldr f z   = runIdentity >>> flip f z
    foldl f z   = runIdentity >>> f z
    foldMap a2m = runIdentity >>> a2m
