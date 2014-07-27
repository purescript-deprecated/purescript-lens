module Examples.Nested where

  import Control.Lens

  import Debug.Trace

  type Foo =
    { foo :: {bar :: Number}
    , baz :: Boolean
    }

  -- Can't have type signatures if we use the lens function
  -- foo :: forall s t a b r. Lens {foo :: a | r} {foo :: b | r} a b
  foo = lens (\o -> o.foo) (\o x -> o{foo = x})
  -- bar :: forall s t a b r. Lens {bar :: a | r} {bar :: b | r} a b
  bar = lens (\o -> o.bar) (\o x -> o{bar = x})
  -- baz :: forall s t a b r. Lens {baz :: a | r} {baz :: b | r} a b
  baz = lens (\o -> o.baz) (\o x -> o{baz = x})

  obj = {foo: {bar: 0}, baz: true}

  succ x = x + 1

  foreign import showFooImpl
    "function showFooImpl(foo) {\
    \  return JSON.stringify(foo, null, 4);\
    \}" :: forall a. a -> String

  main = do
    trace $ showFooImpl obj
    trace $ showFooImpl $ baz.~10 $ obj
    trace $ showFooImpl $ foo..bar.~10 $ obj
    trace $ showFooImpl $ foo..bar+~40 $ obj
    trace $ showFooImpl $ obj^.foo..bar
    trace $ showFooImpl (obj#foo..bar%~succ)
    trace $ showFooImpl (over (foo..bar) succ obj)
