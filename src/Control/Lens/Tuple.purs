module Control.Lens.Tuple
  ( Field1
  , Field2
  , _1
  , _2
  ) where

  import Control.Lens.Type (Lens())
  import Control.Monad.Identity (Identity(..))

  import Data.Tuple (Tuple(..))

  class Field1 s t a b where
    _1 :: Lens s t a b

  class Field2 s t a b where
    _2 :: Lens s t a b

  instance field1Identity :: Field1 (Identity a) (Identity b) a b where
    _1 a2fb (Identity x) = Identity <$> a2fb x

  instance field1Tuple :: Field1 (Tuple a c) (Tuple b c) a b where
    _1 a2fb (Tuple a c) = (\a -> Tuple a c) <$> a2fb a

  instance field2Tuple :: Field2 (Tuple a b) (Tuple a c) b c where
    _2 b2fc (Tuple a b) = Tuple a <$> b2fc b
