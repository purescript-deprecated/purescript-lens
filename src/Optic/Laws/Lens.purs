-- | Valid `Lens`es should satisfy three laws.
module Optic.Laws.Lens where

  import Optic.Getter (view)
  import Optic.Setter (set)
  import Optic.Types (Lens(), Lens'())

  import Prelude (class Eq, (&&), (==))

  -- | A valid `Lens` satisfies all three of the following laws.
  validLens :: forall s a. Eq a => Eq s => Lens' s a -> s -> a -> a -> a -> Boolean
  validLens l s x y z = getSet l s && setGet l s x && setSet l s y z

  -- | If you get a value out, and then set it immediately back,
  -- | nothing should change.
  getSet :: forall s a. Eq s => Lens' s a -> s -> Boolean
  getSet l s = set l (view l s) s == s

  -- | If you set a value, and them get it immediately out,
  -- | you should get the value you set.
  setGet :: forall s a. Eq a => Lens' s a -> s -> a -> Boolean
  setGet l s x = view l (set l x s) == x

  -- | If you set two values, the last set is the one that matters.
  setSet :: forall s a b. Eq s => Lens s s a b -> s -> b -> b -> Boolean
  setSet l s x y = set l y (set l x s) == set l y s
