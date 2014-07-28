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
  import Data.Tuple (snd, Tuple(..))

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
    conjoined qa2br _ = qa2br

  class (Conjoined p f g) <= Indexable i p f g where
    indexed :: forall a b i. p a b -> i -> a -> b

  instance indexableArr :: Indexable i (->) Identity Identity where
    indexed a2b _ = a2b

  data Indexing f a = Indexing (Number -> Tuple Number (f a))

  runIndexing :: forall f a. Indexing f a -> Number -> Tuple Number (f a)
  runIndexing (Indexing f) = f

  -- indexing :: forall f s t a b p g h
  --          .  (Indexable Number (->) Identity Identity)
  --          => ((a -> Indexing f b) -> s -> Indexing f t)
  --          -> (a -> (f b))
  --          -> s
  --          -> f t
  -- indexing f pafb s =
  --   snd $ runIndexing (f (\a -> Indexing (\n -> Tuple (n + 1) (indexed pafb n a))) s) 0

  -- Orphan instances should be moved where they belong.

  instance traversableIdentity :: Traversable Identity where
    traverse a2mb (Identity a) = Identity <$> a2mb a
    sequence (Identity ma) = Identity <$> ma

  instance foldableIdentity :: Foldable Identity where
    foldr f z   = runIdentity >>> flip f z
    foldl f z   = runIdentity >>> f z
    foldMap a2m = runIdentity >>> a2m
