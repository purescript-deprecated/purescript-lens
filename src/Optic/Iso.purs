module Optic.Iso
  ( iso
  ) where

  import Optic.Types (Iso())

  import Prelude (Functor, map)
  import Data.Profunctor (dimap, Profunctor)

  iso :: forall s t a b. (s -> a) -> (b -> t) -> Iso s t a b
  iso sa bt = dimap sa (map bt)
