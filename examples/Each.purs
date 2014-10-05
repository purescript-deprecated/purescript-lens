module Example.Control.Lens.Each where

  import Control.Lens
  -- Have to import typeclass because re-exporting doesn't work yet.
  import Control.Lens.Each (Each)

  import Data.String
  import Data.Tuple

  import Debug.Trace

  foo :: [Number]
  foo = [1,2,3] # each +~ 2

  bar :: Tuple Number Number
  bar = ("Hi" ~ "everybody!") # each %~ length

  data RGBA = RGBA Number Number Number Number

  instance eachRGBA :: Each RGBA RGBA Number Number where
    each f (RGBA r g b a) = RGBA <$> f r <*> f g <*> f b <*> f a

  instance showRGBA :: Show RGBA where
    show (RGBA r g b a) = "RGBA (" ++ show r  ++ ") (" ++ show g  ++ ") (" ++ show b  ++ ") (" ++ show a ++ ")"

  baz :: RGBA
  baz = RGBA 0 128 255 1

  main = do
    print foo
    print bar
    -- Another case of broken inference...
    print ((baz # each +~ 10) :: RGBA)
