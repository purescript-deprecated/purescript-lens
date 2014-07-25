module Control.Lens
  -- Getter
  ( view
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
  )  where

  import qualified Control.Lens.Getter as CLG
  import qualified Control.Lens.Lens as CLL
  import qualified Control.Lens.Setter as CLS

  -- Getter
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

