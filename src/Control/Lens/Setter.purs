module Control.Lens.Setter
  ( ASetter()
  , ASetterP()
  , Setting()
  , SettingP()
  , set
  ) where

  import Control.Lens.Type
  import Control.Monad.Identity

  type ASetter s t a b = (a -> Identity b) -> s -> Identity t
  type ASetterP s a = ASetter s s a a
  type Setting p s t a b = p a (Identity b) -> s -> Identity t
  type SettingP p s a = Setting p s s a a

  set :: forall s t a b. ASetter s t a b -> b -> s -> t
  set stab b = runIdentity <<< stab (Identity <<< const b)
