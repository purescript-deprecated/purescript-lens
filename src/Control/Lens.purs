module Control.Lens
  ( (..)
  -- Getter
  , (^.)
  , to
  , view
  -- Lens
  , (<#>), (??)
  , lens
  -- Prism
  , prism
  , prism'
  , _Left
  , _Right
  , _Just
  , _Nothing
  -- Setter
  , (%~), (.~), (+~), (-~), (*~), (//~), (||~), (&&~), (<>~), (++~), (?~)
  , argument
  , contramapped
  , mapped
  , over
  , set
  , set'
  , sets
  -- Type
  , Accessing()
  , ASetter()
  , ASetterP()
  , Getting()
  , Getter()
  , Lens()
  , LensP()
  , Optical()
  , OpticalP()
  , Prism()
  , PrismP()
  , Setter()
  , SetterP()
  , Setting()
  , SettingP()
  ) where

  import qualified Control.Lens.Getter as Getter
  import qualified Control.Lens.Lens as Lens
  import qualified Control.Lens.Prism as Prism
  import qualified Control.Lens.Setter as Setter
  import qualified Control.Lens.Type as Type

  -- Getter
  infixl 8 ^.
  (^.) = Getter.(^.)
  to   = Getter.to
  view = Getter.view

  -- Lens
  infixl 1 <#>
  infixl 1 ??
  (<#>) = Lens.(<#>)
  (??)  = Lens.(??)
  lens  = Lens.lens

  -- Prism
  prism      = Prism.prism
  prism'     = Prism.prism'
  _Left      = Prism._Left
  _Right     = Prism._Right
  _Just      = Prism._Just
  _Nothing   = Prism._Nothing

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
  (%~)         = Setter.(%~)
  (.~)         = Setter.(.~)
  (+~)         = Setter.(+~)
  (-~)         = Setter.(-~)
  (*~)         = Setter.(*~)
  (//~)        = Setter.(//~)
  (||~)        = Setter.(||~)
  (&&~)        = Setter.(&&~)
  (<>~)        = Setter.(<>~)
  (++~)        = Setter.(++~)
  (?~)         = Setter.(?~)
  argument     = Setter.argument
  contramapped = Setter.contramapped
  mapped       = Setter.mapped
  over         = Setter.over
  set          = Setter.set
  set'         = Setter.set'
  sets         = Setter.sets

  infixr 9 ..
  (..) = (<<<)

  type Accessing p m s a     = Type.Accessing p m s a
  type ASetter s t a b       = Type.ASetter s t a b
  type ASetterP s a          = Type.ASetterP s a
  type Getting r s a         = Type.Getting r s a
  type Getter s a            = Type.Getter s a
  type Lens s t a b          = Type.Lens s t a b
  type LensP s a             = Type.LensP s a
  type Optical p q f s t a b = Type.Optical p q f s t a b
  type OpticalP p q f s a    = Type.OpticalP p q f s a
  type Prism s t a b         = Type.Prism s t a b
  type PrismP s a            = Type.PrismP s a
  type Setter s t a b        = Type.Setter s t a b
  type SetterP s a           = Type.SetterP s a
  type Setting p s t a b     = Type.Setting p s t a b
  type SettingP p s a        = Type.SettingP p s a
