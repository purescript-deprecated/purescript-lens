module Control.Lens
  -- Getter
  ( (^.)
  , view
  -- Lens
  , lens
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
  , _1
  , _2
  )  where

  import qualified Control.Lens.Getter as CLG
  import qualified Control.Lens.Lens as CLL
  import qualified Control.Lens.Setter as CLS
  import qualified Control.Lens.Tuple as CLT

  -- Getter
  (^.) = CLG.(^.)
  view = CLG.view

  -- Lens
  lens = CLL.lens

  -- Setter
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
  _1 = CLT._1
  _2 = CLT._2

