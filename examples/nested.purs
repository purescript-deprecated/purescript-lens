module Nested where

  import Control.Lens.Lens
  import Control.Lens.Type

  type Foo =
    { _foo :: {_bar :: Number}
    , _baz :: Boolean
    }

  baz :: LensP Foo Boolean
  baz f {_foo = _f, _baz = b} = (\baz -> {_foo: _f, _baz: baz}) <$> f b

  foo :: LensP Foo {_bar :: Number}
  foo f {_foo = {_bar = n}, _baz = b} = (\foo -> {_foo: foo, _baz: b}) <$> f {_bar: n}

  bar :: LensP {_bar :: Number} Number
  bar f {_bar = n} = (\bar -> {_bar: bar}) <$> f n

  fooBar :: LensP Foo Number
  fooBar = foo <<< bar

  unit_ = unit

  foreign import showFooImpl
    "function showFooImpl(foo) {\
    \  console.log(JSON.stringify(foo, null, 4));\
    \  return unit_;\
    \}" :: forall a. a -> Unit
