module Control.Arrow.ArrowLoop where

  import Control.Arrow (Arrow)
  import Data.Tuple (Tuple(..))

  class (Arrow a) <= ArrowLoop a where
    loop :: forall a b c d. a (Tuple b d) (Tuple c d) -> a b c

  -- instance arrowLoopArr :: ArrowLoop (->) where
    -- loop :: (Tuple b d -> Tuple c d) -> b -> c
    -- loop f b = case f (Tuple b d) of (Tuple c d) -> c
