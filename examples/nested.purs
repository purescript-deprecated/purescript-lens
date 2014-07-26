module Nested where

  import Control.Lens
  import Control.Lens.Type

  import Debug.Trace

  type Foo =
    { foo :: {bar :: Number}
    , baz :: Boolean
    }

  foo :: forall s t a b r. Lens {foo :: a | r} {foo :: b | r} a b
  foo a2fb obj = (\foo -> obj{foo = foo}) <$> a2fb obj.foo

  bar :: forall s t a b r. Lens {bar :: a | r} {bar :: b | r} a b
  bar a2fb obj = (\bar -> obj{bar = bar}) <$> a2fb obj.bar

  baz :: forall s t a b r. Lens {baz :: a | r} {baz :: b | r} a b
  baz a2fb obj = (\baz -> obj{baz = baz}) <$> a2fb obj.baz

  obj = {foo: {bar: 0}, baz: true}

  foreign import showFooImpl
    "function showFooImpl(foo) {\
    \  return JSON.stringify(foo, null, 4);\
    \}" :: forall a. a -> String

  main = do
    trace $ showFooImpl obj
    trace $ showFooImpl ((baz.~10) obj)
    trace $ showFooImpl ((foo..bar.~10) obj)
    trace $ showFooImpl ((foo..bar+~40) obj)
    trace $ showFooImpl (obj^.(foo..bar))
