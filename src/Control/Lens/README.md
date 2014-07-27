# Module Documentation

## Module Control.Lens.Getter

### Types

    type Getting r s a = (a -> Const r a) -> s -> Const r s


### Values

    (^.) :: forall s a. s -> Getting a s a -> a

    use :: forall s a m. (Monad m, MonadState s m) => Getting a s a -> m a

    view :: forall r a m. (Monad m, MonadReader r m) => Getting a r a -> m a


## Module Control.Lens.Lens

### Values

    lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b


## Module Control.Lens.Prism

### Values

    prism :: forall s t a b. (b -> t) -> (s -> Either t a) -> Prism s t a b


## Module Control.Lens.Setter

### Types

    type ASetter s t a b = (a -> Identity b) -> s -> Identity t

    type ASetterP s a = ASetter s s a a

    type Setting p s t a b = p a (Identity b) -> s -> Identity t

    type SettingP p s a = Setting p s s a a


### Values

    (%~) :: forall p s t a b. (Profunctor p) => Setting p s t a b -> p a b -> s -> t

    (&&~) :: forall s t a. (BoolLike a) => ASetter s t a a -> a -> s -> t

    (*~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t

    (++~) :: forall s t a. (Semigroup a) => ASetter s t a a -> a -> s -> t

    (+~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t

    (-~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t

    (.~) :: forall s t a b. ASetter s t a b -> b -> s -> t

    (/~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t

    (<>~) :: forall s t a. (Semigroup a) => ASetter s t a a -> a -> s -> t

    (?~) :: forall s t a b. ASetter s t a (Maybe b) -> b -> s -> t

    (||~) :: forall s t a. (BoolLike a) => ASetter s t a a -> a -> s -> t

    argument :: forall p r a b. (Profunctor p) => Setter (p b r) (p a r) a b

    contramapped :: forall f a b. (Contravariant f) => Setter (f a) (f b) b a

    mapped :: forall f a b. (Functor f, Settable f) => (a -> f b) -> f a -> f (f b)

    over :: forall p s t a b. (Profunctor p) => (p a (Identity b) -> s -> Identity t) -> p a b -> s -> t

    set :: forall s t a b. ASetter s t a b -> b -> s -> t

    set' :: forall s a. ASetterP s a -> a -> s -> s

    sets :: forall p q f s t a b. (Profunctor p, Profunctor q, Settable f) => (p a b -> q s t) -> Optical p q f s t a b


## Module Control.Lens.Tuple

### Values

    (~) :: forall a b. a -> b -> Tuple a b

    _1 :: forall a b c. Lens (Tuple a c) (Tuple b c) a b

    _2 :: forall a b c. Lens (Tuple a b) (Tuple a c) b c


## Module Control.Lens.Type

### Types

    type Lens s t a b = forall f. (Functor f) => (a -> f b) -> s -> f t

    type LensP s a = Lens s s a a

    type Optic p f s t a b = p a (f b) -> p s (f t)

    type OpticP p f s a = Optic p f s s a a

    type Optical p q f s t a b = p a (f b) -> q s (f t)

    type OpticalP p q f s a = Optical p q f s s a a

    type Prism s t a b = forall f p. (Applicative f, Choice p) => p a (f b) -> p s (f t)

    type PrismP s a = Prism s s a a

    type Setter s t a b = forall f. (Settable f) => (a -> f b) -> s -> f t

    type SetterP s a = Setter s s a a

    type Traversal s t a b = forall f. (Applicative f) => (a -> f b) -> s -> f t

    type TraversalP s a = Traversal s s a a



