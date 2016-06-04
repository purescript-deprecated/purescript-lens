## Module Optic.Internal.Setter

#### `Settable`

``` purescript
class (Applicative f, Distributive f, Traversable f) <= Settable f where
  untainted :: forall a. f a -> a
  untaintedDot :: forall a b p. Profunctor p => p a (f b) -> p a b
  taintedDot :: forall a b p. Profunctor p => p a b -> p a (f b)
```

##### Instances
``` purescript
Settable Identity
```


