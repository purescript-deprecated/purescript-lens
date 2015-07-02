module Optic.Core
  ( module Optic.Getter
  , module Optic.Lens  
  , module Optic.Prism 
  , module Optic.Setter
  , module Optic.Types 
  , module Optic.Core
  ) where

import Prelude ((<<<))

import Optic.Getter
import Optic.Lens  
import Optic.Prism 
import Optic.Setter
import Optic.Types 

infixr 9 ..

(..) = (<<<)
