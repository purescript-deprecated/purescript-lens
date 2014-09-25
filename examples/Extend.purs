module Control.Lens.Examples.Extend where

  import Control.Lens ((.~), (^.), (<#>), lens, Lens(), Setter())

  import Data.Foreign.EasyFFI (unsafeForeignFunction)
  import Debug.Trace (trace)

  ffi = unsafeForeignFunction

  fooExt :: forall a r. Setter { | r} {foo :: a | r} Unit a
  fooExt f o = ffi ["obj", "x"] "obj.foo = x, obj" o <$> f unit

  foo :: forall a b r. Lens {foo :: a | r} {foo :: b | r} a b
  foo f o@{foo = a} = f a <#> \b -> o{foo = b}

  main = do
    let bar = {bar: 3}
    trace ((bar # fooExt.~"one")^.foo)
    trace ((bar # fooExt.~"two").foo)
    -- This will not compile.
    -- trace $ {bar: 3}^.fooExt
