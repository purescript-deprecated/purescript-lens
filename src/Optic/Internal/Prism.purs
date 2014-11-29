module Optic.Internal.Prism where

  import Data.Profunctor (Profunctor)
  import Data.Profunctor.Choice (Choice)
  import Data.Either (either, Either(..))

  data Market a b s t = Market (b -> t) (s -> Either t a)
  type MarketP a = Market a a

  instance functorMarket :: Functor (Market a b s) where
    (<$>) t2u (Market b2t s2Eta) =
      Market (b2t >>> t2u) (s2Eta >>> either (t2u >>> Left) Right)

  instance profunctorMarket :: Profunctor (Market a b) where
    dimap s2r t2u (Market b2t r2Eta) =
      Market (b2t >>> t2u) (s2r >>> r2Eta >>> either (t2u >>> Left) Right)

  instance choiceMarket :: Choice (Market a b) where
    -- left' :: Market a b s t -> Market a b (Either s u) (Either t u)
    -- right' :: Market a b s t -> Market a b (Either s t) (Either s u)
    -- I have no clue what's going on here.
    -- This is basically a straight lift from:
    -- https://github.com/ekmett/lens/blob/master/src/Control/Lens/Internal/Prism.hs#L56-L68
    left' (Market b2t s2Eta) = Market (b2t >>> Left) \thing -> case thing of
      Left s -> either (Left >>> Left) Right (s2Eta s)
      Right c -> Left $ Right c

    right' (Market b2t s2Eta) = Market (b2t >>> Right) \thing -> case thing of
      Left c -> Left $ Left c
      Right s -> either (Right >>> Left) Right (s2Eta s)
