# Module Documentation

## Module Control.Lens.At

### Types

    type Index a b = b

    type IxValue a b = b


### Type Classes

    class Ixed m a b where
      ix :: Index m a -> TraversalP m (IxValue m b)


### Type Class Instances

    instance ixedArrEA :: (Eq e) => Ixed (e -> a) e a

    instance ixedArrayNumberA :: Ixed [a] Number a

    instance ixedIdentityAA :: Ixed (Identity a) Unit a

    instance ixedMapKV :: (Ord k) => Ixed (M.Map k v) k v

    instance ixedMaybeUnit :: Ixed (Maybe a) Unit a


## Module Control.Lens.Fold

### Values

    filtered :: forall f a p. (Applicative f, Choice p) => (a -> Boolean) -> OpticP p f a a


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

    _Just :: forall a b. Prism (Maybe a) (Maybe b) a b

    _Left :: forall a b c. Prism (Either a c) (Either b c) a b

    _Nothing :: forall a b. PrismP (Maybe a) Unit

    _Right :: forall a b c. Prism (Either a b) (Either a c) b c

    prism :: forall s t a b. (b -> t) -> (s -> Either t a) -> Prism s t a b

    prism' :: forall s a b. (b -> s) -> (s -> Maybe a) -> Prism s s a b


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

    mapped :: forall f a b. (Functor f) => Setter (f a) (f b) a b

    over :: forall p s t a b. (Profunctor p) => Setting p s t a b -> p a b -> s -> t

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

    type Iso s t a b = forall p f. (Functor f, Profunctor p) => p a (f b) -> p s (f t)

    type IsoP s a = Iso s s a a

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



