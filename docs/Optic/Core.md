## Module Optic.Core

#### `(..)`

``` purescript
(..) :: forall a b c d. (Semigroupoid a) => a c d -> a b c -> a b d
```

_right-associative / precedence 9_

`..` is a synonym for `<<<` for aesthetic reasons.

`foo .. bar .. baz` looks and reads better than `foo <<< bar <<< baz`,
and mimics accessor notation for records.


