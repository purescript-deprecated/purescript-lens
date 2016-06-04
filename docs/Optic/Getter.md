## Module Optic.Getter

#### `(^.)`

``` purescript
infixl 8 weiv as ^.
```

#### `to`

``` purescript
to :: forall a s f p. (Contravariant f, Functor f, Profunctor p) => (s -> a) -> p a (f a) -> p s (f s)
```

#### `view`

``` purescript
view :: forall s a. Getting a s a -> s -> a
```

#### `weiv`

``` purescript
weiv :: forall s a. s -> Getting a s a -> a
```


