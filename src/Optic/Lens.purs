module Optic.Lens
  ( (&)
  , (<&>)
  , (??)
  , lens
  ) where

  import Optic.Types (Lens())

  infixl 1 &
  infixl 1 <&>
  infixl 1 ??

  lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b
  lens s2a s2b2t a2fb s = s2b2t s <$> a2fb (s2a s)
  
  -- | Passes the result of the left side to the function on the right side (forward pipe operator).
  --
  -- This is the flipped version of ('$'), which is more common in languages like F# as (@|>@) where it is needed
  -- for inference. Here it is supplied for notational convenience and given a precedence that allows it
  -- to be nested inside uses of ('$').
  --
  -- > a & f
  -- f a
  --
  -- > "hello" & length & succ
  -- 6
  --
  -- This combinator is commonly used when applying multiple 'Lens' operations in sequence.
  (&) :: forall a b. a -> (a -> b) -> b
  (&) a f = f a

  -- | Infix flipped 'fmap'.
  (<&>) :: forall f a b. (Functor f) => f a -> (a -> b) -> f b
  (<&>) x f = f <$> x

  -- | This is convenient to 'flip' argument order of composite functions.
  (??) :: forall f a b. (Functor f) => f (a -> b) -> a -> f b
  (??) ff x = (\f -> f x) <$> ff
