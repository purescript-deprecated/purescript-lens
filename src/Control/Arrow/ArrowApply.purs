module Control.Arrow.ArrowApply where

  import Control.Arrow (Arrow)
  import Data.Tuple (Tuple(..))

  class (Arrow a) <= ArrowApply a where
    app :: forall b c. a (Tuple (a b c) b) c

  instance arrowApplyArr :: ArrowApply (->) where
    app (Tuple b2c b) = b2c b
