## Module Optic.Setter

#### `(%~)`

``` purescript
infixr 4 over as %~
```

#### `(.~)`

``` purescript
infixr 4 set as .~
```

#### `(+~)`

``` purescript
infixr 4 add as +~
```

#### `(-~)`

``` purescript
infixr 4 sub as -~
```

#### `(*~)`

``` purescript
infixr 4 mul as *~
```

#### `(/~)`

``` purescript
infixr 4 div as /~
```

#### `(||~)`

``` purescript
infixr 4 or as ||~
```

#### `(&&~)`

``` purescript
infixr 4 and as &&~
```

#### `(<>~)`

``` purescript
infixr 4 concat as <>~
```

#### `(?~)`

``` purescript
infixr 4 setJust as ?~
```

#### `argument`

``` purescript
argument :: forall p r a b. Profunctor p => Setter (p b r) (p a r) a b
```

#### `contramapped`

``` purescript
contramapped :: forall f a b. Contravariant f => Setter (f a) (f b) b a
```

#### `mapped`

``` purescript
mapped :: forall f a b. Functor f => Setter (f a) (f b) a b
```

#### `over`

``` purescript
over :: forall p s t a b. Profunctor p => Setting p s t a b -> p a b -> s -> t
```

#### `set`

``` purescript
set :: forall s t a b. ASetter s t a b -> b -> s -> t
```

#### `set'`

``` purescript
set' :: forall s a. ASetter' s a -> a -> s -> s
```

#### `sets`

``` purescript
sets :: forall p q f s t a b. (Profunctor p, Profunctor q, Settable f) => (p a b -> q s t) -> Optical p q f s t a b
```

#### `add`

``` purescript
add :: forall s t a. Semiring a => ASetter s t a a -> a -> s -> t
```

#### `sub`

``` purescript
sub :: forall s t a. Ring a => ASetter s t a a -> a -> s -> t
```

#### `mul`

``` purescript
mul :: forall s t a. Semiring a => ASetter s t a a -> a -> s -> t
```

#### `div`

``` purescript
div :: forall s t a. EuclideanRing a => ASetter s t a a -> a -> s -> t
```

#### `or`

``` purescript
or :: forall s t a. HeytingAlgebra a => ASetter s t a a -> a -> s -> t
```

#### `and`

``` purescript
and :: forall s t a. HeytingAlgebra a => ASetter s t a a -> a -> s -> t
```

#### `concat`

``` purescript
concat :: forall s t a. Semigroup a => ASetter s t a a -> a -> s -> t
```

#### `setJust`

``` purescript
setJust :: forall s t a b. ASetter s t a (Maybe b) -> b -> s -> t
```


