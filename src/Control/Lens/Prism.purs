module Control.Lens.Prism
  ( APrism()
  , APrismP()
  , clonePrism
  , prism
  , prism'
  , withPrism
  , _Left
  , _Right
  , _Just
  , _Nothing
  ) where

  import Control.Lens.Internal.Prism (Market(..))
  import Control.Lens.Type (Lens(), Prism(), PrismP())
  import Control.Monad.Identity (runIdentity, Identity(..))

  import Data.Profunctor (dimap, lmap, Profunctor)
  import Data.Profunctor.Choice (right', Choice)
  import Data.Profunctor.Rep (rep, tabulate, Representable)
  import Data.Either (either, Either(..))
  import Data.Maybe (maybe, Maybe(..))

  type APrism s t a b = Market a b a (Identity b) -> Market a b s (Identity t)
  type APrismP s a = APrism s s a a

  clonePrism :: forall f p s t a b. (Applicative f, Choice p) => APrism  s t a b -> p a (f b) -> p s (f t)
  clonePrism stab = withPrism stab prism

  -- outside :: forall f p r s t a b. (Profunctor p, Representable p f) => APrism s t a b -> Lens (p t r) (p s r) (p b r) (p a r)
  -- outside stab = withPrism stab \b2t s2Eta f ft ->
  --   (\fa -> tabulate $ either (rep ft) (rep fa) <<< s2Eta) <$> f (lmap b2t ft)

  prism :: forall f p s t a b. (Applicative f, Choice p) => (b -> t) -> (s -> Either t a) -> p a (f b) -> p s (f t)
  prism b2t s2Eta pafb = dimap s2Eta (either pure ((<$>) b2t)) (right' pafb)

  prism' :: forall s a b. (b -> s) -> (s -> Maybe a) -> Prism s s a b
  prism' b2s s2Ma = prism b2s (\s -> maybe (Left s) Right $ s2Ma s)

  withPrism :: forall b r a t s. APrism s t a b -> ((b -> t) -> (s -> Either t a) -> r) -> r
  withPrism stab f = case stab (Market Identity Right) of
    Market b2t s2Eta -> f (runIdentity <<< b2t) (s2Eta >>> either (runIdentity >>> Left) Right)

  _Left :: forall a b c. Prism (Either a c) (Either b c) a b
  _Left = prism Left $ either Right (Left <<< Right)

  _Right :: forall a b c. Prism (Either a b) (Either a c) b c
  _Right = prism Right $ either (Left <<< Left) Right

  _Just :: forall a b. Prism (Maybe a) (Maybe b) a b
  _Just = prism Just $ maybe (Left Nothing) Right

  _Nothing :: forall a b. PrismP (Maybe a) Unit
  _Nothing = prism' (const Nothing) $ maybe Nothing (const $ Just unit)
