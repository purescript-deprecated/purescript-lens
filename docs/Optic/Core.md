## Module Optic.Core

#### `(..)`

``` purescript
infixr 9 o as ..
```

`..` is a synonym for `<<<` for aesthetic reasons.

`foo .. bar .. baz` looks and reads better than `foo <<< bar <<< baz`,
and mimics accessor notation for records.

#### `o`

``` purescript
o :: forall a b c d. Semigroupoid a => a c d -> a b c -> a b d
```


### Re-exported from Optic.Getter:

#### `weiv`

``` purescript
weiv :: forall s a. s -> Getting a s a -> a
```

#### `view`

``` purescript
view :: forall s a. Getting a s a -> s -> a
```

#### `to`

``` purescript
to :: forall a s f p. (Contravariant f, Functor f, Profunctor p) => (s -> a) -> p a (f a) -> p s (f s)
```

#### `(^.)`

``` purescript
infixl 8 weiv as ^.
```

### Re-exported from Optic.Lens:

#### `lens`

``` purescript
lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b
```

#### `flip'`

``` purescript
flip' :: forall f a b. Functor f => f (a -> b) -> a -> f b
```

#### `(??)`

``` purescript
infixl 1 flip' as ??
```

### Re-exported from Optic.Prism:

#### `withPrism`

``` purescript
withPrism :: forall b r a t s. APrism s t a b -> ((b -> t) -> (s -> Either t a) -> r) -> r
```

#### `prism'`

``` purescript
prism' :: forall s a b. (b -> s) -> (s -> Maybe a) -> Prism s s a b
```

#### `prism`

``` purescript
prism :: forall f p s t a b. (Applicative f, Choice p) => (b -> t) -> (s -> Either t a) -> p a (f b) -> p s (f t)
```

#### `only`

``` purescript
only :: forall a. Eq a => a -> Prism' a Unit
```

#### `nearly`

``` purescript
nearly :: forall a. a -> (a -> Boolean) -> Prism' a Unit
```

#### `matching`

``` purescript
matching :: forall s t a b. APrism s t a b -> s -> Either t a
```

#### `isn't`

``` purescript
isn't :: forall s t a b. APrism s t a b -> s -> Boolean
```

#### `is`

``` purescript
is :: forall s t a b. APrism s t a b -> s -> Boolean
```

#### `clonePrism`

``` purescript
clonePrism :: forall f p s t a b. (Applicative f, Choice p) => APrism s t a b -> p a (f b) -> p s (f t)
```

### Re-exported from Optic.Setter:

#### `sub`

``` purescript
sub :: forall s t a. Ring a => ASetter s t a a -> a -> s -> t
```

#### `sets`

``` purescript
sets :: forall p q f s t a b. (Profunctor p, Profunctor q, Settable f) => (p a b -> q s t) -> Optical p q f s t a b
```

#### `setJust`

``` purescript
setJust :: forall s t a b. ASetter s t a (Maybe b) -> b -> s -> t
```

#### `set'`

``` purescript
set' :: forall s a. ASetter' s a -> a -> s -> s
```

#### `set`

``` purescript
set :: forall s t a b. ASetter s t a b -> b -> s -> t
```

#### `over`

``` purescript
over :: forall p s t a b. Profunctor p => Setting p s t a b -> p a b -> s -> t
```

#### `or`

``` purescript
or :: forall s t a. HeytingAlgebra a => ASetter s t a a -> a -> s -> t
```

#### `mul`

``` purescript
mul :: forall s t a. Semiring a => ASetter s t a a -> a -> s -> t
```

#### `mapped`

``` purescript
mapped :: forall f a b. Functor f => Setter (f a) (f b) a b
```

#### `div`

``` purescript
div :: forall s t a. EuclideanRing a => ASetter s t a a -> a -> s -> t
```

#### `contramapped`

``` purescript
contramapped :: forall f a b. Contravariant f => Setter (f a) (f b) b a
```

#### `concat`

``` purescript
concat :: forall s t a. Semigroup a => ASetter s t a a -> a -> s -> t
```

#### `argument`

``` purescript
argument :: forall p r a b. Profunctor p => Setter (p b r) (p a r) a b
```

#### `and`

``` purescript
and :: forall s t a. HeytingAlgebra a => ASetter s t a a -> a -> s -> t
```

#### `add`

``` purescript
add :: forall s t a. Semiring a => ASetter s t a a -> a -> s -> t
```

#### `(||~)`

``` purescript
infixr 4 or as ||~
```

#### `(?~)`

``` purescript
infixr 4 setJust as ?~
```

#### `(<>~)`

``` purescript
infixr 4 concat as <>~
```

#### `(/~)`

``` purescript
infixr 4 div as /~
```

#### `(.~)`

``` purescript
infixr 4 set as .~
```

#### `(-~)`

``` purescript
infixr 4 sub as -~
```

#### `(+~)`

``` purescript
infixr 4 add as +~
```

#### `(*~)`

``` purescript
infixr 4 mul as *~
```

#### `(&&~)`

``` purescript
infixr 4 and as &&~
```

#### `(%~)`

``` purescript
infixr 4 over as %~
```

### Re-exported from Optic.Types:

#### `Setting'`

``` purescript
type Setting' p s a = Setting p s s a a
```

#### `Setting`

``` purescript
type Setting p s t a b = p a (Identity b) -> s -> Identity t
```

#### `Setter'`

``` purescript
type Setter' s a = Setter s s a a
```

#### `Setter`

``` purescript
type Setter s t a b = forall f. Settable f => (a -> f b) -> s -> f t
```

#### `Prism'`

``` purescript
type Prism' s a = Prism s s a a
```

#### `Prism`

``` purescript
type Prism s t a b = forall f p. (Applicative f, Choice p) => p a (f b) -> p s (f t)
```

#### `Optical'`

``` purescript
type Optical' p q f s a = Optical p q f s s a a
```

#### `Optical`

``` purescript
type Optical p q f s t a b = p a (f b) -> q s (f t)
```

#### `Lens'`

``` purescript
type Lens' s a = Lens s s a a
```

#### `Lens`

``` purescript
type Lens s t a b = forall f. Functor f => (a -> f b) -> s -> f t
```

#### `Getting`

``` purescript
type Getting r s a = (a -> Const r a) -> s -> Const r s
```

#### `Getter`

``` purescript
type Getter s a = forall f. (Contravariant f, Functor f) => (a -> f a) -> s -> f s
```

#### `Accessing`

``` purescript
type Accessing p m s a = p a (Const m a) -> s -> Const m s
```

#### `ASetter'`

``` purescript
type ASetter' s a = ASetter s s a a
```

#### `ASetter`

``` purescript
type ASetter s t a b = (a -> Identity b) -> s -> Identity t
```

#### `APrism'`

``` purescript
type APrism' s a = APrism s s a a
```

#### `APrism`

``` purescript
type APrism s t a b = Market a b a (Identity b) -> Market a b s (Identity t)
```

