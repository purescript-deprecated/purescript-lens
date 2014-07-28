module Data.Profunctor.Rep where

  import Control.Monad.Identity (runIdentity, Identity(..))

  import Data.Profunctor

  type Iso s t a b = forall p f. (Functor f, Profunctor p) => p a (f b) -> p s (f t)

  class (Functor f, Profunctor p) <= Representable p f where
    tabulate :: forall c d. (d -> f c) -> p d c
    rep :: forall c d. p d c -> d -> f c

  instance representableArrIdentity :: Representable (->) Identity where
    tabulate d2Ic = d2Ic >>> runIdentity
    rep      d2c  = d2c  >>> Identity

  class (Functor f, Profunctor p) <= Corepresentable p f where
    cotabulate :: forall c d. (f d -> c) -> p d c
    corep :: forall c d. p d c -> f d -> c

  instance corepresentableArrIdentity :: Corepresentable (->) Identity where
    cotabulate id2c = Identity    >>> id2c
    corep      d2c  = runIdentity >>> d2c

  -- tabulated :: forall p q c d. (Representable p, Representable q) => Iso (d -> Rep p c)
