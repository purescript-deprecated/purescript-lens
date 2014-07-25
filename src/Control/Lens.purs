module Control.Lens
  -- Getter
  ( view
  -- Lens
  , lens
  -- Setter
  , set
  ) where

  import qualified Control.Lens.Getter as CLG
  import qualified Control.Lens.Lens as CLL
  import qualified Control.Lens.Setter as CLS

  -- Getter
  view = CLG.view

  -- Lens
  lens = CLL.lens

  -- Setter
  set = CLS.set
