module Control.Arrow.ArrowChoice where

  import Control.Arrow (Arrow)

  import Data.Either (Either(..))

  class (Arrow a) <= ArrowChoice a where
    left :: forall b c d. a b c -> a (Either b d) (Either c d)

  instance arrowChoiceArr :: ArrowChoice (->) where
    left b2c (Left b)  = Left $ b2c b
    left _   (Right c) = Right c
