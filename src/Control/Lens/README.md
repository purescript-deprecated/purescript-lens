# Module Documentation

## Module Control.Lens.Getter

### Types


### Values

    (^.) :: forall s a. s -> Getting a s a -> a

    to :: forall a s f p. (Contravariant f, Functor f, Profunctor p) => (s -> a) -> p a (f a) -> p s (f s)

    view :: forall s a. Getting a s a -> s -> a


## Module Control.Lens.Lens

### Values

    (<#>) :: forall f a b. (Functor f) => f a -> (a -> b) -> f b

    (??) :: forall f a b. (Functor f) => f (a -> b) -> a -> f b

    lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b


## Module Control.Lens.Prism

### Values

    _Just :: forall a b. Prism (Maybe a) (Maybe b) a b

    _Left :: forall a b c. Prism (Either a c) (Either b c) a b

    _Nothing :: forall a b. PrismP (Maybe a) Unit

    _Right :: forall a b c. Prism (Either a b) (Either a c) b c

    prism :: forall f p s t a b. (Applicative f, Choice p) => (b -> t) -> (s -> Either t a) -> p a (f b) -> p s (f t)

    prism' :: forall s a b. (b -> s) -> (s -> Maybe a) -> Prism s s a b


## Module Control.Lens.Setter

### Values

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


## Module Control.Lens.Type

### Types

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



