# Module Documentation

## Module Optic.Core

#### `Accessing`

``` purescript
type Accessing p m s a = OT.Accessing p m s a
```

#### `APrism`

``` purescript
type APrism s t a b = OT.APrism s t a b
```


#### `APrismP`

``` purescript
type APrismP s a = OT.APrismP s a
```


#### `ASetter`

``` purescript
type ASetter s t a b = OT.ASetter s t a b
```


#### `ASetterP`

``` purescript
type ASetterP s a = OT.ASetterP s a
```


#### `Getting`

``` purescript
type Getting r s a = OT.Getting r s a
```


#### `Getter`

``` purescript
type Getter s a = OT.Getter s a
```


#### `Lens`

``` purescript
type Lens s t a b = OT.Lens s t a b
```


#### `LensP`

``` purescript
type LensP s a = OT.LensP s a
```


#### `Optical`

``` purescript
type Optical p q f s t a b = OT.Optical p q f s t a b
```


#### `OpticalP`

``` purescript
type OpticalP p q f s a = OT.OpticalP p q f s a
```


#### `Prism`

``` purescript
type Prism s t a b = OT.Prism s t a b
```


#### `PrismP`

``` purescript
type PrismP s a = OT.PrismP s a
```


#### `Setter`

``` purescript
type Setter s t a b = OT.Setter s t a b
```


#### `SetterP`

``` purescript
type SetterP s a = OT.SetterP s a
```


#### `Setting`

``` purescript
type Setting p s t a b = OT.Setting p s t a b
```


#### `SettingP`

``` purescript
type SettingP p s a = OT.SettingP p s a
```



## Module Optic.Getter

#### `to`

``` purescript
to :: forall a s f p. (Contravariant f, Functor f, Profunctor p) => (s -> a) -> p a (f a) -> p s (f s)
```


#### `view`

``` purescript
view :: forall s a. Getting a s a -> s -> a
```


#### `(^.)`

``` purescript
(^.) :: forall s a. s -> Getting a s a -> a
```



## Module Optic.Lens

#### `lens`

``` purescript
lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b
```


#### `(??)`

``` purescript
(??) :: forall f a b. (Functor f) => f (a -> b) -> a -> f b
```



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
nearly :: forall a. a -> (a -> Boolean) -> PrismP a Unit
```


#### `only`

``` purescript
only :: forall a. (Eq a) => a -> PrismP a Unit
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

#### `(.~)`

``` purescript
(.~) :: forall s t a b. ASetter s t a b -> b -> s -> t
```


#### `(+~)`

``` purescript
(+~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t
```


#### `(-~)`

``` purescript
(-~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t
```


#### `(*~)`

``` purescript
(*~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t
```


#### `(//~)`

``` purescript
(//~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t
```


#### `(||~)`

``` purescript
(||~) :: forall s t a. (BoolLike a) => ASetter s t a a -> a -> s -> t
```


#### `(&&~)`

``` purescript
(&&~) :: forall s t a. (BoolLike a) => ASetter s t a a -> a -> s -> t
```


#### `(<>~)`

``` purescript
(<>~) :: forall s t a. (Semigroup a) => ASetter s t a a -> a -> s -> t
```


#### `(++~)`

``` purescript
(++~) :: forall s t a. (Semigroup a) => ASetter s t a a -> a -> s -> t
```


#### `(?~)`

``` purescript
(?~) :: forall s t a b. ASetter s t a (Maybe b) -> b -> s -> t
```



## Module Optic.Types

#### `Accessing`

``` purescript
type Accessing p m s a = p a (Const m a) -> s -> Const m s
```


#### `APrism`

``` purescript
type APrism s t a b = Market a b a (Identity b) -> Market a b s (Identity t)
```


#### `APrismP`

``` purescript
type APrismP s a = APrism s s a a
```


#### `ASetter`

``` purescript
type ASetter s t a b = (a -> Identity b) -> s -> Identity t
```


#### `ASetterP`

``` purescript
type ASetterP s a = ASetter s s a a
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
type Lens s t a b = forall f. (Functor f) => (a -> f b) -> s -> f t
```


#### `LensP`

``` purescript
type LensP s a = Lens s s a a
```


#### `Optical`

``` purescript
type Optical p q f s t a b = p a (f b) -> q s (f t)
```


#### `OpticalP`

``` purescript
type OpticalP p q f s a = Optical p q f s s a a
```


#### `Prism`

``` purescript
type Prism s t a b = forall f p. (Applicative f, Choice p) => p a (f b) -> p s (f t)
```


#### `PrismP`

``` purescript
type PrismP s a = Prism s s a a
```


#### `Setter`

``` purescript
type Setter s t a b = forall f. (Settable f) => (a -> f b) -> s -> f t
```


#### `SetterP`

``` purescript
type SetterP s a = Setter s s a a
```


#### `Setting`

``` purescript
type Setting p s t a b = p a (Identity b) -> s -> Identity t
```


#### `SettingP`

``` purescript
type SettingP p s a = Setting p s s a a
```




