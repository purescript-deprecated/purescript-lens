module Control.Lens.Cons
  ( Cons
  , Snoc
  , (<|)
  , (|>)
  , _Cons
  , _Snoc
  , _cons
  , head
  , init
  , last
  , snoc
  , tail
  , uncons
  , unsnoc
  ) where

  import Control.Lens.Equality (simply)
  import Control.Lens.Fold ((^?))
  import Control.Lens.Prism (prism)
  import Control.Lens.Review (review)
  import Control.Lens.Tuple (_1, _2)
  import Control.Lens.Type (Prism(), TraversalP())
  import Control.Monad.Reader.Class (MonadReader)

  import Data.Either (Either(..))
  import Data.Maybe (Maybe())
  import Data.Profunctor (dimap)
  import Data.Tuple (curry, snd, uncurry, Tuple(..))

  import Prelude hiding (cons)

  import qualified Data.Array as A
  import qualified Data.Array.Unsafe as AU

  infixr 5 <|
  infixl 5 |>

  class Cons s t a b where
    _Cons :: Prism (s a) (t b) (Tuple a (s a)) (Tuple b (t b))

  instance consArray :: Cons [] [] a b where
    _Cons = prism (uncurry (:)) \xs -> case xs of
      (x:xs') -> Right (Tuple x xs')
      []      -> Left  []

  class Snoc s t a b where
    _Snoc :: Prism (s a) (t b) (Tuple (s a) a) (Tuple (t b) b)

  instance snocArray :: Snoc [] [] a b where
    _Snoc = prism (uncurry A.snoc) \xs -> case xs of
      [] -> Left  []
      _  -> Right (Tuple (AU.init xs) (AU.last xs))

  (<|) :: forall a s. (Cons s s a a) => a -> s a -> s a
  (<|) = curry (simply review _Cons)

  _cons :: forall a s. (Cons s s a a) => a -> s a -> s a
  _cons = (<|)

  uncons :: forall a s. (Cons s s a a) => s a -> Maybe (Tuple a (s a))
  uncons xs = xs ^? _Cons

  head :: forall a s. (Cons s s a a) => TraversalP (s a) a
  head = _Cons <<< _1

  tail :: forall a s. (Cons s s a a) => TraversalP (s a) (s a)
  tail = _Cons <<< _2

  (|>) :: forall a s. (Snoc s s a a) => s a -> a -> s a
  (|>) = curry (simply review _Snoc)

  snoc :: forall a s. (Snoc s s a a) => s a -> a -> s a
  snoc = curry (simply review _Snoc)

  unsnoc :: forall a s. (Snoc s s a a) => s a -> Maybe (Tuple (s a) a)
  unsnoc xs = xs ^? _Snoc

  init :: forall a s. (Snoc s s a a) => TraversalP (s a) (s a)
  init = _Snoc <<< _1

  last :: forall a s. (Snoc s s a a) => TraversalP (s a) a
  last = _Snoc <<< _2
