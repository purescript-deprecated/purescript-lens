## Module Optic.Prism

#### `clonePrism`

``` purescript
clonePrism :: forall f p s t a b. (Applicative f, Choice p) => APrism s t a b -> p a (f b) -> p s (f t)
```

#### `is`

``` purescript
is :: forall s t a b. APrism s t a b -> s -> Boolean
```

#### `isn't`

``` purescript
isn't :: forall s t a b. APrism s t a b -> s -> Boolean
```

#### `matching`

``` purescript
matching :: forall s t a b. APrism s t a b -> s -> Either t a
```

#### `nearly`

``` purescript
nearly :: forall a. a -> (a -> Boolean) -> Prism' a Unit
```

#### `only`

``` purescript
only :: forall a. Eq a => a -> Prism' a Unit
```

#### `prism`

``` purescript
prism :: forall f p s t a b. (Applicative f, Choice p) => (b -> t) -> (s -> Either t a) -> p a (f b) -> p s (f t)
```

#### `prism'`

``` purescript
prism' :: forall s a b. (b -> s) -> (s -> Maybe a) -> Prism s s a b
```

#### `withPrism`

``` purescript
withPrism :: forall b r a t s. APrism s t a b -> ((b -> t) -> (s -> Either t a) -> r) -> r
```


