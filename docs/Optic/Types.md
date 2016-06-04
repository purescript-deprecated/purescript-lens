## Module Optic.Types

#### `Accessing`

``` purescript
type Accessing p m s a = p a (Const m a) -> s -> Const m s
```

#### `APrism`

``` purescript
type APrism s t a b = Market a b a (Identity b) -> Market a b s (Identity t)
```

#### `APrism'`

``` purescript
type APrism' s a = APrism s s a a
```

#### `ASetter`

``` purescript
type ASetter s t a b = (a -> Identity b) -> s -> Identity t
```

#### `ASetter'`

``` purescript
type ASetter' s a = ASetter s s a a
```

#### `Getting`

``` purescript
type Getting r s a = (a -> Const r a) -> s -> Const r s
```

#### `Getter`

``` purescript
type Getter s a = forall f. (Contravariant f, Functor f) => (a -> f a) -> s -> f s
```

#### `Lens`

``` purescript
type Lens s t a b = forall f. Functor f => (a -> f b) -> s -> f t
```

#### `Lens'`

``` purescript
type Lens' s a = Lens s s a a
```

#### `Optical`

``` purescript
type Optical p q f s t a b = p a (f b) -> q s (f t)
```

#### `Optical'`

``` purescript
type Optical' p q f s a = Optical p q f s s a a
```

#### `Prism`

``` purescript
type Prism s t a b = forall f p. (Applicative f, Choice p) => p a (f b) -> p s (f t)
```

#### `Prism'`

``` purescript
type Prism' s a = Prism s s a a
```

#### `Setter`

``` purescript
type Setter s t a b = forall f. Settable f => (a -> f b) -> s -> f t
```

#### `Setter'`

``` purescript
type Setter' s a = Setter s s a a
```

#### `Setting`

``` purescript
type Setting p s t a b = p a (Identity b) -> s -> Identity t
```

#### `Setting'`

``` purescript
type Setting' p s a = Setting p s s a a
```


