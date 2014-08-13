module Control.Lens.Lens
  ( (#~)
  , (<#>)
  , (??)
  , lens
  ) where

  import Control.Lens.Type (Lens())
  import Control.Monad.State (execState, State())

  infixl 1 #~
  infixl 1 <#>
  infixl 1 ??

  lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b
  lens s2a s2b2t a2fb s = s2b2t s <$> a2fb (s2a s)

  (#~) :: forall a s. s -> State s a -> s
  (#~) s sa = execState sa s

  (<#>) :: forall f a b. (Functor f) => f a -> (a -> b) -> f b
  (<#>) x f = f <$> x

  (??) :: forall f a b. (Functor f) => f (a -> b) -> a -> f b
  (??) ff x = (\f -> f x) <$> ff
