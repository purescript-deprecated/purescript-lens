## Module Optic.Lens

#### `(??)`

``` purescript
infixl 1 flip' as ??
```

#### `lens`

``` purescript
lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b
```

#### `flip'`

``` purescript
flip' :: forall f a b. Functor f => f (a -> b) -> a -> f b
```


