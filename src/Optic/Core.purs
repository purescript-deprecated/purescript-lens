module Optic.Core where

  import qualified Optic.Getter as OG
  import qualified Optic.Lens   as OL
  import qualified Optic.Prism  as OP
  import qualified Optic.Setter as OS
  import qualified Optic.Types  as OT

  infixr 9 ..
  (..) = (<<<)

  -- Getter

  infixl 8 ^.

  to   = OG.to
  view = OG.view
  (^.) = OG.(^.)

  -- Lens

  infixl 1 <#>
  infixl 1 ??

  (<#>) = OL.(<#>)
  (??)  = OL.(??)
  lens  = OL.lens

  -- Prism

  clonePrism = OP.clonePrism
  is         = OP.is
  isn't      = OP.isn't
  matching   = OP.matching
  nearly     = OP.nearly
  only       = OP.only
  prism      = OP.prism
  prism'     = OP.prism'
  withPrism  = OP.withPrism
  _Left      = OP._Left
  _Right     = OP._Right
  _Just      = OP._Just
  _Nothing   = OP._Nothing

  -- Setter

  infixr 4 %~
  infixr 4 .~
  infixr 4 +~
  infixr 4 -~
  infixr 4 *~
  infixr 4 //~
  infixr 4 ||~
  infixr 4 &&~
  infixr 4 <>~
  infixr 4 ++~
  infixr 4 ?~

  (%~)         = OS.(%~)
  (.~)         = OS.(.~)
  (+~)         = OS.(+~)
  (-~)         = OS.(-~)
  (*~)         = OS.(*~)
  (//~)        = OS.(//~)
  (||~)        = OS.(||~)
  (&&~)        = OS.(&&~)
  (<>~)        = OS.(<>~)
  (++~)        = OS.(++~)
  (?~)         = OS.(?~)
  argument     = OS.argument
  contramapped = OS.contramapped
  mapped       = OS.mapped
  over         = OS.over
  set          = OS.set
  set'         = OS.set'
  sets         = OS.sets

  -- Types

  type Accessing p m s a     = OT.Accessing p m s a
  type APrism s t a b        = OT.APrism s t a b
  type APrismP s a           = OT.APrismP s a
  type ASetter s t a b       = OT.ASetter s t a b
  type ASetterP s a          = OT.ASetterP s a
  type Getting r s a         = OT.Getting r s a
  type Getter s a            = OT.Getter s a
  type Lens s t a b          = OT.Lens s t a b
  type LensP s a             = OT.LensP s a
  type Optical p q f s t a b = OT.Optical p q f s t a b
  type OpticalP p q f s a    = OT.OpticalP p q f s a
  type Prism s t a b         = OT.Prism s t a b
  type PrismP s a            = OT.PrismP s a
  type Setter s t a b        = OT.Setter s t a b
  type SetterP s a           = OT.SetterP s a
  type Setting p s t a b     = OT.Setting p s t a b
  type SettingP p s a        = OT.SettingP p s a
