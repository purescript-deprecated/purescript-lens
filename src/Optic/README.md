# Module Documentation

## Module Optic.Core

### Types


    type APrism s t a b = OT.APrism s t a b


    type APrismP s a = OT.APrismP s a


    type ASetter s t a b = OT.ASetter s t a b


    type ASetterP s a = OT.ASetterP s a

     Types

    type Accessing p m s a = OT.Accessing p m s a


    type Getter s a = OT.Getter s a


    type Getting r s a = OT.Getting r s a


    type Lens s t a b = OT.Lens s t a b


    type LensP s a = OT.LensP s a


    type Optical p q f s t a b = OT.Optical p q f s t a b


    type OpticalP p q f s a = OT.OpticalP p q f s a


    type Prism s t a b = OT.Prism s t a b


    type PrismP s a = OT.PrismP s a


    type Setter s t a b = OT.Setter s t a b


    type SetterP s a = OT.SetterP s a


    type Setting p s t a b = OT.Setting p s t a b


    type SettingP p s a = OT.SettingP p s a


## Module Optic.Getter

### Values


    (^.) :: forall s a. s -> Getting a s a -> a


    to :: forall a s f p. (Contravariant f, Functor f, Profunctor p) => (s -> a) -> p a (f a) -> p s (f s)


    view :: forall s a. Getting a s a -> s -> a


## Module Optic.Lens

### Values


    (??) :: forall f a b. (Functor f) => f (a -> b) -> a -> f b


    lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b


## Module Optic.Prism

### Values


    clonePrism :: forall f p s t a b. (Applicative f, Choice p) => APrism s t a b -> p a (f b) -> p s (f t)


    is :: forall s t a b. APrism s t a b -> s -> Boolean


    isn't :: forall s t a b. APrism s t a b -> s -> Boolean


    matching :: forall s t a b. APrism s t a b -> s -> Either t a


    nearly :: forall a. a -> (a -> Boolean) -> PrismP a Unit


    only :: forall a. (Eq a) => a -> PrismP a Unit


    prism :: forall f p s t a b. (Applicative f, Choice p) => (b -> t) -> (s -> Either t a) -> p a (f b) -> p s (f t)


    prism' :: forall s a b. (b -> s) -> (s -> Maybe a) -> Prism s s a b


    withPrism :: forall b r a t s. APrism s t a b -> ((b -> t) -> (s -> Either t a) -> r) -> r


## Module Optic.Setter

### Values

     Line noise time.

    (%~) :: forall p s t a b. (Profunctor p) => Setting p s t a b -> p a b -> s -> t


    (&&~) :: forall s t a. (BoolLike a) => ASetter s t a a -> a -> s -> t


    (*~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t


    (++~) :: forall s t a. (Semigroup a) => ASetter s t a a -> a -> s -> t


    (+~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t


    (-~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t


    (.~) :: forall s t a b. ASetter s t a b -> b -> s -> t


    (//~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t


    (<>~) :: forall s t a. (Semigroup a) => ASetter s t a a -> a -> s -> t


    (?~) :: forall s t a b. ASetter s t a (Maybe b) -> b -> s -> t


    (||~) :: forall s t a. (BoolLike a) => ASetter s t a a -> a -> s -> t


    argument :: forall p r a b. (Profunctor p) => Setter (p b r) (p a r) a b


    contramapped :: forall f a b. (Contravariant f) => Setter (f a) (f b) b a


    mapped :: forall f a b. (Functor f) => Setter (f a) (f b) a b


    over :: forall p s t a b. (Profunctor p) => Setting p s t a b -> p a b -> s -> t


    set :: forall s t a b. ASetter s t a b -> b -> s -> t


    set' :: forall s a. ASetterP s a -> a -> s -> s


    sets :: forall p q f s t a b. (Profunctor p, Profunctor q, Settable f) => (p a b -> q s t) -> Optical p q f s t a b


## Module Optic.Types

### Types


    type APrism s t a b = Market a b a (Identity b) -> Market a b s (Identity t)


    type APrismP s a = APrism s s a a


    type ASetter s t a b = (a -> Identity b) -> s -> Identity t


    type ASetterP s a = ASetter s s a a


    type Accessing p m s a = p a (Const m a) -> s -> Const m s


    type Getter s a = forall f. (Contravariant f, Functor f) => (a -> f a) -> s -> f s


    type Getting r s a = (a -> Const r a) -> s -> Const r s


    type Lens s t a b = forall f. (Functor f) => (a -> f b) -> s -> f t


    type LensP s a = Lens s s a a


    type Optical p q f s t a b = p a (f b) -> q s (f t)


    type OpticalP p q f s a = Optical p q f s s a a


    type Prism s t a b = forall f p. (Applicative f, Choice p) => p a (f b) -> p s (f t)


    type PrismP s a = Prism s s a a


    type Setter s t a b = forall f. (Settable f) => (a -> f b) -> s -> f t


    type SetterP s a = Setter s s a a


    type Setting p s t a b = p a (Identity b) -> s -> Identity t


    type SettingP p s a = Setting p s s a a



