## Module Optic.Setter

#### `argument`

``` purescript
argument :: forall p r a b. (Profunctor p) => Setter (p b r) (p a r) a b
```

#### `contramapped`

``` purescript
contramapped :: forall f a b. (Contravariant f) => Setter (f a) (f b) b a
```

#### `mapped`

``` purescript
mapped :: forall f a b. (Functor f) => Setter (f a) (f b) a b
```

#### `over`

``` purescript
over :: forall p s t a b. (Profunctor p) => Setting p s t a b -> p a b -> s -> t
```

#### `set`

``` purescript
set :: forall s t a b. ASetter s t a b -> b -> s -> t
```

#### `set'`

``` purescript
set' :: forall s a. ASetterP s a -> a -> s -> s
```

#### `sets`

``` purescript
sets :: forall p q f s t a b. (Profunctor p, Profunctor q, Settable f) => (p a b -> q s t) -> Optical p q f s t a b
```

#### `(%~)`

``` purescript
(%~) :: forall p s t a b. (Profunctor p) => Setting p s t a b -> p a b -> s -> t
```

_right-associative / precedence 4_

#### `(.~)`

``` purescript
(.~) :: forall s t a b. ASetter s t a b -> b -> s -> t
```

_right-associative / precedence 4_

#### `(+~)`

``` purescript
(+~) :: forall s t a. (Semiring a) => ASetter s t a a -> a -> s -> t
```

_right-associative / precedence 4_

#### `(-~)`

``` purescript
(-~) :: forall s t a. (Ring a) => ASetter s t a a -> a -> s -> t
```

_right-associative / precedence 4_

#### `(*~)`

``` purescript
(*~) :: forall s t a. (Semiring a) => ASetter s t a a -> a -> s -> t
```

_right-associative / precedence 4_

#### `(//~)`

``` purescript
(//~) :: forall s t a. (DivisionRing a) => ASetter s t a a -> a -> s -> t
```

_right-associative / precedence 4_

#### `(||~)`

``` purescript
(||~) :: forall s t a. (BooleanAlgebra a) => ASetter s t a a -> a -> s -> t
```

_right-associative / precedence 4_

#### `(&&~)`

``` purescript
(&&~) :: forall s t a. (BooleanAlgebra a) => ASetter s t a a -> a -> s -> t
```

_right-associative / precedence 4_

#### `(<>~)`

``` purescript
(<>~) :: forall s t a. (Semigroup a) => ASetter s t a a -> a -> s -> t
```

_right-associative / precedence 4_

#### `(++~)`

``` purescript
(++~) :: forall s t a. (Semigroup a) => ASetter s t a a -> a -> s -> t
```

_right-associative / precedence 4_

#### `(?~)`

``` purescript
(?~) :: forall s t a b. ASetter s t a (Maybe b) -> b -> s -> t
```

_right-associative / precedence 4_


