module Optic.Core
  ( module Optic.Getter
  , module Optic.Lens
  , module Optic.Prism
  , module Optic.Setter
  , module Optic.Types
  , (..)
  , o
  ) where

  import Optic.Getter (to, view, weiv, (^.))
  import Optic.Lens (flip', lens, (??))
  import Optic.Prism (clonePrism, is, isn't, matching, nearly, only, prism, prism', withPrism)
  import Optic.Setter (add, and, argument, concat, contramapped, div, mapped, mul, or, over, set, set', setJust, sets, sub, (%~), (&&~), (*~), (+~), (-~), (.~), (/~), (<>~), (?~), (||~))
  import Optic.Types (APrism, APrism', ASetter, ASetter', Accessing, Getter, Getting, Lens, Lens', Optical, Optical', Prism, Prism', Setter, Setter', Setting, Setting')


  import Prelude (class Semigroupoid, (<<<))

  -- | `..` is a synonym for `<<<` for aesthetic reasons.
  -- |
  -- | `foo .. bar .. baz` looks and reads better than `foo <<< bar <<< baz`,
  -- | and mimics accessor notation for records.
  infixr 9 o as ..

  o :: forall a b c d. Semigroupoid a => a c d -> a b c -> a b d
  o = (<<<)
