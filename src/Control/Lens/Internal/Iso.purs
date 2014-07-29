module Control.Lens.Internal.Iso where

  import Data.Profunctor (Profunctor)

  data Exchange a b s t = Exchange (s -> a) (b -> t)

  instance functorExchange :: Functor (Exchange a b s) where
    (<$>) t2u (Exchange s2a b2t) = Exchange s2a (b2t >>> t2u)

  instance profunctorExchange :: Profunctor (Exchange a b) where
    -- dimap :: (s -> r) -> (t -> u) -> Exchange a b r t -> Exchange a b s u
    dimap s2r t2u (Exchange r2a b2t) = Exchange (s2r >>> r2a) (b2t >>> t2u)
