module Data.Profunctor.Choice where

  import Data.Either (Either(..))
  import Data.Profunctor (Profunctor)
  import Data.Tagged (Tagged(..))

  class (Profunctor p) <= Choice p where
    left' :: forall a b c. p a b -> p (Either a c) (Either b c)
    right' :: forall a b c. p b c -> p (Either a b) (Either a c)

  instance choiceArr :: Choice (->) where
    left' a2b (Left a)  = Left $ a2b a
    left' _   (Right c) = Right c

    right' = (<$>)

  instance choiceTagged :: Choice Tagged where
    left'  (Tagged x) = Tagged $ Left x
    right' (Tagged x) = Tagged $ Right x
