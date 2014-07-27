module Control.Lens
  ( (..)
  -- Getter
  , (^.)
  , use
  , view
  -- Lens
  , lens
  -- Prism
  , prism
  , prism'
  , _Left
  , _Right
  , _Just
  , _Nothing
  -- Setter
  , (%~), (.~), (+~), (-~), (*~), (/~), (||~), (&&~), (<>~), (++~), (?~)
  , argument
  , contramapped
  , mapped
  , over
  , set
  , set'
  , sets
  -- Tuple
  , (~)
  , _1
  , _2
  -- Type
  , Lens()
  , LensP()
  , Optic()
  , OpticP()
  , Optical()
  , OpticalP()
  , Prism()
  , PrismP()
  , Setter()
  , SetterP()
  , Traversal()
  , TraversalP()
  )  where

  import qualified Control.Lens.Getter as CLG
  import qualified Control.Lens.Lens as CLL
  import qualified Control.Lens.Prism as CLP
  import qualified Control.Lens.Setter as CLS
  import qualified Control.Lens.Tuple as CLT
  import qualified Control.Lens.Type as Type

  -- Getter
  infixl 8 ^.
  (^.) = CLG.(^.)
  use = CLG.use
  view = CLG.view

  -- Lens
  lens = CLL.lens

  -- Prism
  prism    = CLP.prism
  prism'   = CLP.prism'
  _Left    = CLP._Left
  _Right   = CLP._Right
  _Just    = CLP._Just
  _Nothing = CLP._Nothing

  -- Setter
  infixr 4 %~
  infixr 4 .~
  infixr 4 +~
  infixr 4 -~
  infixr 4 *~
  infixr 4 /~
  infixr 4 ||~
  infixr 4 &&~
  infixr 4 <>~
  infixr 4 ++~
  infixr 4 ?~
  (%~)         = CLS.(%~)
  (.~)         = CLS.(.~)
  (+~)         = CLS.(+~)
  (-~)         = CLS.(-~)
  (*~)         = CLS.(*~)
  (/~)         = CLS.(/~)
  (||~)        = CLS.(||~)
  (&&~)        = CLS.(&&~)
  (<>~)        = CLS.(<>~)
  (++~)        = CLS.(++~)
  (?~)         = CLS.(?~)
  argument     = CLS.argument
  contramapped = CLS.contramapped
  mapped       = CLS.mapped
  over         = CLS.over
  set          = CLS.set
  set'         = CLS.set'
  sets         = CLS.sets

  -- Tuple
  infixr 6 ~
  (~) = CLT.(~)
  _1  = CLT._1
  _2  = CLT._2

  infixr 9 ..
  (..) = (<<<)

  type Lens s t a b          = Type.Lens s t a b
  type LensP s a             = Type.LensP s a
  type Optic p f s t a b     = Type.Optic p f s t a b
  type OpticP p f s a        = Type.OpticP p f s a
  type Optical p q f s t a b = Type.Optical p q f s t a b
  type OpticalP p q f s a    = Type.OpticalP p q f s a
  type Prism s t a b         = Type.Prism s t a b
  type PrismP s a            = Type.PrismP s a
  type Setter s t a b        = Type.Setter s t a b
  type SetterP s a           = Type.SetterP s a
  type Traversal s t a b     = Type.Traversal s t a b
  type TraversalP s a        = Type.TraversalP s a
