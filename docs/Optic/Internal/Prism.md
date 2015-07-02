## Module Optic.Internal.Prism

#### `Market`

``` purescript
data Market a b s t
  = Market (b -> t) (s -> Either t a)
```

##### Instances
``` purescript
instance functorMarket :: Functor (Market a b s)
instance profunctorMarket :: Profunctor (Market a b)
instance choiceMarket :: Choice (Market a b)
```

#### `MarketP`

``` purescript
type MarketP a = Market a a
```


