# Module Documentation

## Module Control.Lens.Getter

### Types

    data Const a b where
      Const :: a -> Const a b

    type Getting r s a = (a -> Const r a) -> s -> Const r s


### Type Class Instances

    instance functorConst :: Functor (Const a)


### Values

    view :: forall a s. Getting a s a -> s -> a


## Module Control.Lens.Lens

### Values

    lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b


## Module Control.Lens.Setter

### Types

    type ASetter s t a b = (a -> Identity b) -> s -> Identity t

    type ASetterP s a = ASetter s s a a

    type Setting p s t a b = p a (Identity b) -> s -> Identity t

    type SettingP p s a = Setting p s s a a


### Values

    set :: forall s t a b. ASetter s t a b -> b -> s -> t


## Module Control.Lens.Type

### Types

    type Lens s t a b = forall f. (Functor f) => (a -> f b) -> s -> f t

    type LensP s a = Lens s s a a



