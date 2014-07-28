module Examples.Nested where

  import Control.Lens

  import Debug.Trace

  type Foo =
    { foo :: {bar :: Number}
    , baz :: Boolean
    }

  foo :: forall a b r. Lens {foo :: a | r} {foo :: b | r} a b
  foo = lens (\o -> o.foo) (\o x -> o{foo = x})
  foo' :: forall a b r. Lens {foo :: a | r} {foo :: b | r} a b
  foo' = foo
  bar :: forall a b r. Lens {bar :: a | r} {bar :: b | r} a b
  bar = lens (\o -> o.bar) (\o x -> o{bar = x})
  baz :: forall a b r. Lens {baz :: a | r} {baz :: b | r} a b
  baz = lens (\o -> o.baz) (\o x -> o{baz = x})

  fooBar :: forall a b r r'. Lens {foo :: {bar :: a | r} | r'} {foo :: {bar :: b | r} | r'} a b
  fooBar = foo..bar

  obj :: Foo
  obj = {foo: {bar: 0}, baz: true}

  succ x = x + 1

  foreign import showFooImpl
    "function showFooImpl(foo) {\
    \  return JSON.stringify(foo, null, 4);\
    \}" :: forall a. a -> String

  main = do
    trace $ showFooImpl obj
    trace $ showFooImpl $ baz.~10 $ obj
    trace $ showFooImpl $ baz.~"wat" $ obj
    trace $ showFooImpl $ foo'..bar.~10 $ obj
    trace $ showFooImpl $ fooBar+~40 $ obj
    trace $ showFooImpl $ obj^.fooBar
    trace $ showFooImpl (obj#fooBar%~succ)
    trace $ showFooImpl (over (fooBar) succ obj)
