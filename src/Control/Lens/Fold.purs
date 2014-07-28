module Control.Lens.Fold
  ( filtered
  ) where

  import Control.Lens.Type (OpticP())

  import Data.Either (either, Either(..))
  import Data.Profunctor (dimap)
  import Data.Profunctor.Choice (right', Choice)

  filtered :: forall f a p. (Applicative f, Choice p) => (a -> Boolean) -> OpticP p f a a
  filtered p = dimap (\x -> if p x then Right x else Left x) (either pure id) <<< right'
