module Control.Lens.Examples.Extend where

  import Control.Lens ((.~), (^.), lens, Lens(), LensP(), Setter())

  import Data.Function (runFn3, Fn3())
  import Debug.Trace (trace)

  fooExt :: forall a r. Setter { | r} {foo :: a | r} Unit a
  fooExt = lens (const unit) (runFn3 ext "foo")

  foo :: forall a b r. Lens {foo :: a | r} {foo :: b | r} a b
  foo = lens (\o -> o.foo) (\o x -> o{foo = x})

  foreign import ext
    "function ext(key, obj, val) {\
    \  obj[key] = val;\
    \  return obj;\
    \}" :: forall a r r'. Fn3 String { | r} a { | r'}

  main = do
    trace $ (fooExt.~"wat") {bar: 3} ^. foo
