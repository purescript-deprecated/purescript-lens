module Control.Lens.Tuple
  ( (~)
  , _1
  , _2
  ) where

  -- import Control.Monad.Identity (Identity(..))
  import Control.Lens.Type (Lens())

  import Data.Tuple (Tuple(..))

  infixr 6 ~

  (~) :: forall a b. a -> b -> Tuple a b
  (~) = Tuple

  -- Actually, these don't compose at all. They also lose inference.
  -- -- There's some issue where PS can't infer the constraints properly.
  -- -- Until that changes/gets fixed (can it?) just use the actual definition of Lens
  -- class Field1 s t a b where
  --   _1 :: forall f. (Functor f) => (a -> f b) -> s -> f t

  -- class Field2 s t a b where
  --   _2 :: forall f. (Functor f) => (a -> f b) -> s -> f t

  -- instance field1Identity :: Field1 (Identity a) (Identity b) a b where
  --   _1 a2fb (Identity x) = Identity <$> a2fb x

  -- instance field1Tuple :: Field1 (Tuple a c) (Tuple b c) a b where
  --   _1 a2fb (Tuple a c) = (\a -> Tuple a c) <$> a2fb a

  -- instance field2Tuple :: Field2 (Tuple a b) (Tuple a c) b c where
  --   _2 b2fc (Tuple a b) = Tuple a <$> b2fc b

  _1 :: forall a b c. Lens (Tuple a c) (Tuple b c) a b
  _1 a2fb (Tuple a c) = (\b -> Tuple b c) <$> a2fb a

  _2 :: forall a b c. Lens (Tuple a b) (Tuple a c) b c
  _2 a2fb (Tuple a b) = Tuple a <$> a2fb b
