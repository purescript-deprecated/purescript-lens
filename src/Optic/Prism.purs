module Optic.Prism
  ( clonePrism
  , is
  , isn't
  , matching
  , nearly
  , only
  , prism
  , prism'
  , withPrism
  ) where

  import Data.Either (either, Either(..))
  import Data.Identity (Identity(..))
  import Data.Maybe (maybe, Maybe(..))
  import Data.Newtype (unwrap)
  import Data.Profunctor (dimap)
  import Data.Profunctor.Choice (right, class Choice)

  import Optic.Internal.Prism (Market(..))
  import Optic.Types (APrism(), Prism(), Prism'())

  import Prelude ( class Applicative, class Eq
                 , Unit()
                 , ($), (==), (<<<), (<$>), (>>>)
                 , const, not, pure, unit
                 )

  clonePrism :: forall f p s t a b. Applicative f => Choice p => APrism  s t a b -> p a (f b) -> p s (f t)
  clonePrism stab = withPrism stab prism

  is :: forall s t a b. APrism s t a b -> s -> Boolean
  is stab s = either (const false) (const true) $ matching stab s

  isn't :: forall s t a b. APrism s t a b -> s -> Boolean
  isn't stab s = not $ is stab s

  matching :: forall s t a b. APrism s t a b -> s -> Either t a
  matching stab = withPrism stab \_ s -> s

  nearly :: forall a. a -> (a -> Boolean) -> Prism' a Unit
  nearly x p = prism' (const x) $ guard <<< p
    where
      guard :: Boolean -> Maybe Unit
      guard true  = Just unit
      guard false = Nothing

  only :: forall a. Eq a => a -> Prism' a Unit
  only x = nearly x ((==) x)

  prism :: forall f p s t a b. Applicative f => Choice p => (b -> t) -> (s -> Either t a) -> p a (f b) -> p s (f t)
  prism b2t s2Eta pafb = dimap s2Eta (either pure ((<$>) b2t)) (right pafb)

  prism' :: forall s a b. (b -> s) -> (s -> Maybe a) -> Prism s s a b
  prism' b2s s2Ma = prism b2s (\s -> maybe (Left s) Right $ s2Ma s)

  withPrism :: forall b r a t s. APrism s t a b -> ((b -> t) -> (s -> Either t a) -> r) -> r
  withPrism stab f = case stab (Market Identity Right) of
    Market b2t s2Eta -> f (unwrap <<< b2t) (s2Eta >>> either (unwrap >>> Left) Right)
