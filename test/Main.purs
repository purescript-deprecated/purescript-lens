module Test.Main where

  import Control.Monad.Eff (Eff)
  import Control.Monad.Eff.Console (CONSOLE, logShow)

  import Optic.Core

  import Prelude (class Show, Unit, (#), ($), (+), (<>), const, show, discard)

  newtype Foo bar baz = Foo
    { foo :: { bar :: bar }
    , baz :: baz
    }

  instance showFoo :: (Show bar, Show baz) => Show (Foo bar baz) where
    show (Foo x) = "(Foo " <> show x.foo.bar <> " " <> show x.baz <> ")"

  _Foo :: forall bar1 baz1 bar2 baz2.
            Lens (Foo bar1 baz1)
                 (Foo bar2 baz2)
                 { baz :: baz1, foo :: { bar :: bar1 } }
                 { baz :: baz2, foo :: { bar :: bar2 } }
  _Foo = lens (\(Foo x) -> x) (const Foo)

  foo :: forall a b r. Lens { foo :: a | r } { foo :: b | r } a b
  foo = lens _.foo (_ { foo = _ })

  foo' :: forall a b r. Lens { foo :: a | r } { foo :: b | r } a b
  foo' = foo

  bar :: forall a b r. Lens { bar :: a | r } { bar :: b | r } a b
  bar = lens _.bar (_ { bar = _ })

  baz :: forall a b r. Lens { baz :: a | r } { baz :: b | r } a b
  baz = lens _.baz (_ { baz = _ })

  fooBar :: forall a b r r'. Lens { foo :: { bar :: a | r } | r' } { foo :: { bar :: b | r } | r' } a b
  fooBar = foo..bar

  obj :: Foo Int Boolean
  obj = Foo { foo: { bar: 0 }, baz: true }

  succ :: Int -> Int
  succ x = x + 1

  main :: forall r. Eff (console :: CONSOLE | r) Unit
  main = do
    logShow obj                                 -- (Foo 0 true)
    logShow $ _Foo..baz .~ 10 $ obj             -- (Foo 0 10)
    logShow $ _Foo..baz .~ "wat" $ obj          -- (Foo 0 "wat")
    logShow $ _Foo..foo'..bar .~ 10 $ obj       -- (Foo 10 true)
    logShow $ _Foo..fooBar +~ 40 $ obj          -- (Foo 40 true)
    logShow $ obj ^. _Foo..fooBar               -- 0
    logShow $ obj # _Foo..fooBar %~ succ        -- (Foo 1 true)
    logShow $ over (_Foo..fooBar) succ obj      -- (Foo 1 true)
