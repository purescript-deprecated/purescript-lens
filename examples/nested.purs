module Nested where

  import Control.Lens.Lens
  import Control.Lens.Type

  type Foo =
    { _foo :: {_bar :: Number}
    , _baz :: Boolean
    }

  baz :: LensP Foo Boolean
  baz f obj = (\baz -> obj{_baz = baz}) <$> f obj._baz

  foo :: LensP Foo {_bar :: Number}
  foo f obj = (\foo -> obj{_foo = foo}) <$> f obj._foo

  bar :: LensP {_bar :: Number} Number
  bar f obj = (\bar -> obj{_bar = bar}) <$> f obj._bar

  fooBar :: LensP Foo Number
  fooBar = foo <<< bar

  unit_ = unit

  foreign import showFooImpl
    "function showFooImpl(foo) {\
    \  console.log(JSON.stringify(foo, null, 4));\
    \  return unit_;\
    \}" :: forall a. a -> Unit
