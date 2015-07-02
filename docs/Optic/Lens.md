## Module Optic.Lens

#### `lens`

``` purescript
lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b
```

#### `(??)`

``` purescript
(??) :: forall f a b. (Functor f) => f (a -> b) -> a -> f b
```

_left-associative / precedence 1_


