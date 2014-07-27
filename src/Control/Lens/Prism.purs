module Control.Lens.Prism where

  import Control.Lens.Type (Prism())

  import Data.Profunctor (dimap)
  import Data.Profunctor.Choice (right', Choice)
  import Data.Either (either, Either(..))
  import Data.Maybe (maybe, Maybe(..))

  prism :: forall s t a b. (b -> t) -> (s -> Either t a) -> Prism s t a b
  prism b2t s2Eta pafb = dimap s2Eta (either pure ((<$>) b2t)) (right' pafb)

  -- prism' :: forall s a b. (b -> s) -> (s -> Maybe a) -> Prism s s a b
  prism' b2s s2Ma = prism b2s (\s -> maybe (Left s) Right $ s2Ma s)

  -- _Left :: forall a b c. Prism (Either a c) (Either b c) a b
  _Left = prism Left $ either Right (Left <<< Right)

  -- _Right :: forall a b c. Prism (Either a b) (Either a c) b c
  _Right = prism Right $ either (Left <<< Left) Right

  -- _Just :: forall a b. Prism (Maybe a) (Maybe b) a b
  _Just = prism Just $ maybe (Left Nothing) Right

  -- _Nothing :: forall a b. Prism (Maybe a) (Maybe a) a b
  _Nothing = prism' (const Nothing) $ maybe Nothing (const $ Just unit)
