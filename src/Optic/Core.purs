module Optic.Core
  ( module Optic.Getter
  , module Optic.Iso
  , module Optic.Lens
  , module Optic.Prism
  , module Optic.Setter
  , module Optic.Types
  , (..)
  ) where

  import Optic.Getter
  import Optic.Iso
  import Optic.Lens
  import Optic.Prism
  import Optic.Setter
  import Optic.Types

  import Prelude (Semigroupoid, (<<<))

  infixr 9 ..

  -- | `..` is a synonym for `<<<` for aesthetic reasons.
  -- |
  -- | `foo .. bar .. baz` looks and reads better than `foo <<< bar <<< baz`,
  -- | and mimics accessor notation for records.
  (..) :: forall a b c d. (Semigroupoid a) => a c d -> a b c -> a b d
  (..) = (<<<)
