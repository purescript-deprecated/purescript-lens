module Data.Distributive where

  import Control.Monad.Identity

  -- Categorical dual of Traversable
  class (Functor f) <= Distributive f where
    -- Dual of sequence
    distribute :: forall a g. (Functor g) => g (f a) -> f (g a)
    -- Default implementation
    -- distribute = collect id
    collect :: forall a b g. (Functor g) => (a -> f b) -> g a -> f (g b)
    -- Default implementation
    -- collect a2gb fa = distribute (a2gb <$> fa)

  cotraverse :: forall a b f g. (Distributive f, Functor g) => (g a -> b) -> g (f a) -> f b
  cotraverse ga2b gfa = ga2b <$> distribute gfa

  instance distributiveIdentity :: Distributive Identity where
    distribute gIdb = Identity (runIdentity <$> gIdb)
    collect a2Idb ga = Identity ((runIdentity <<< a2Idb) <$> ga)
