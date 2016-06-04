## Module Optic.Internal.Prism

#### `Market`

``` purescript
data Market a b s t
  = Market (b -> t) (s -> Either t a)
```

##### Instances
``` purescript
Functor (Market a b s)
Profunctor (Market a b)
Choice (Market a b)
```

#### `Market'`

``` purescript
type Market' a = Market a a
```


