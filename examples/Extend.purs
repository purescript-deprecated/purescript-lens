module Control.Lens.Examples.Extend where

  import Control.Lens ((.~), (^.), lens, Lens(), Setter())

  import Data.Foreign.EasyFFI (unsafeForeignFunction)
  import Debug.Trace (trace)

  ffi = unsafeForeignFunction

  fooExt :: forall a r. Setter { | r} {foo :: a | r} Unit a
  fooExt = lens (const unit) (ffi ["obj", "x"] "obj.foo = x, obj")

  foo :: forall a b r. Lens {foo :: a | r} {foo :: b | r} a b
  foo = lens (\o -> o.foo) (\o x -> o{foo = x})

  main = do
    trace $ (fooExt.~"wat") {bar: 3} ^. foo
    trace $ ((fooExt.~"wat") {bar: 3}). foo
    trace $ {bar: 3}^.fooExt
