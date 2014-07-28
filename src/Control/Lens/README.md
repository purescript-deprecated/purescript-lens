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

    type Accessing p m s a = p a (Const m a) -> s -> Const m s

    type Getting r s a = (a -> Const r a) -> s -> Const r s


### Values

    (^.) :: forall s a. s -> Getting a s a -> a

    use :: forall s a m. (Monad m, MonadState s m) => Getting a s a -> m a

    view :: forall r a m. (Monad m, MonadReader r m) => Getting a r a -> m a


## Module Control.Lens.Indexed

### Type Classes

    class (Foldable f) <= FoldableWithIndex i f where
      ifoldMap :: forall a m. (Monoid m) => (i -> a -> m) -> f a -> m

    class (Functor f) <= FunctorWithIndex i f where
      imap :: forall a b. (i -> a -> b) -> f a -> f b

    class (FunctorWithIndex i t, FoldableWithIndex i t, Traversable t) <= TraversableWithIndex i t where
      itraverse :: forall a b f. (Applicative f) => (i -> a -> f b) -> t a -> f (t b)
      itraversed :: forall a b f. IndexedTraversal i (t a) (t b) a b


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


## Module Control.Lens.Traversal

## Module Control.Lens.Tuple

### Values

    (~) :: forall a b. a -> b -> Tuple a b

    _1 :: forall a b c. Lens (Tuple a c) (Tuple b c) a b

    _2 :: forall a b c. Lens (Tuple a b) (Tuple a c) b c


## Module Control.Lens.Type

### Types

    type Action m s a = forall f r. (Effective m r f) => (a -> f a) -> s -> f s

    type As a = EqualityP a a

    type Equality s t a b = forall f p. p a (f b) -> p s (f t)

    type EqualityP s a = Equality s s a a

    type Fold s a = forall f. (Contravariant f, Applicative f) => (a -> f a) -> s -> f s

    type Fold1 s a = forall f. (Contravariant f, Apply f) => (a -> f a) -> s -> f s

    type Getter s a = forall f. (Contravariant f, Functor f) => (a -> f a) -> s -> f s

    type IndexPreservingAction m s a = forall f r p g h. (Conjoined p g h, Effective m r f) => p a (f a) -> p s (f s)

    type IndexPreservingFold s a = forall f p g h. (Conjoined p g h, Contravariant f, Applicative f) => p a (f a) -> p s (f s)

    type IndexPreservingFold1 s a = forall f p g h. (Conjoined p g h, Contravariant f, Apply f) => p a (f a) -> p s (f s)

    type IndexPreservingGetter s a = forall f p g h. (Conjoined p g h, Contravariant f, Functor f) => p a (f a) -> s -> f s

    type IndexPreservingLens s t a b = forall f p g h. (Conjoined p g h, Functor f) => p a (f b) -> p s (f t)

    type IndexPreservingLensP s a = IndexPreservingLens s s a a

    type IndexPreservingMonadicFold m s a = forall f r p g h. (Conjoined p g h, Effective m r f, Applicative f) => p a (f a) -> p s (f s)

    type IndexPreservingRelevantMonadicFold m s a = forall f r p g h. (Conjoined p g h, Effective m r f, Apply f) => p a (f a) -> p s (f s)

    type IndexPreservingSetter s t a b = forall p f g h. (Conjoined p g h, Settable f) => p a (f b) -> p s (f t)

    type IndexPreservingSetterP s a = IndexPreservingSetter s s a a

    type IndexPreservingTraversal s t a b = forall p f g h. (Conjoined p g h, Applicative f) => p a (f b) -> p s (f t)

    type IndexPreservingTraversal1 s t a b = forall p f g h. (Conjoined p g h, Apply f) => p a (f b) -> p s (f t)

    type IndexPreservingTraversal1P s a = IndexPreservingTraversal1 s s a a

    type IndexPreservingTraversalP s a = IndexPreservingTraversal s s a a

    type IndexedAction i m s a = forall f r p g h. (Indexable i p g h, Effective m r f) => p a (f a) -> s -> f s

    type IndexedFold i s a = forall f p g h. (Indexable i p g h, Contravariant f, Applicative f) => p a (f a) -> s -> f s

    type IndexedFold1 i s a = forall f p g h. (Indexable i p g h, Contravariant f, Apply f) => p a (f a) -> s -> f s

    type IndexedGetter i s a = forall f p g h. (Indexable i p g h, Contravariant f, Functor f) => p a (f a) -> s -> f s

    type IndexedLens i s t a b = forall f p g h. (Indexable i p g h, Functor f) => p a (f b) -> s -> f t

    type IndexedLensLike i f s t a b = forall p g h. (Indexable i p g h) => p a (f b) -> s -> f t

    type IndexedLensLikeP i f s a = IndexedLensLike i f s s a a

    type IndexedLensP i s a = IndexedLens i s s a a

    type IndexedMonadicFold i m s a = forall f r p g h. (Indexable i p g h, Effective m r f, Applicative f) => p a (f a) -> s -> f s

    type IndexedRelevantMonadicFold i m s a = forall f r p g h. (Indexable i p g h, Effective m r f, Apply f) => p a (f a) -> s -> f s

    type IndexedSetter i s t a b = forall f p g h. (Indexable i p g h, Settable f) => p a (f b) -> s -> f t

    type IndexedSetterP i s a = IndexedSetter i s s a a

    type IndexedTraversal i s t a b = forall f p g h. (Indexable i p g h, Applicative f) => p a (f b) -> s -> f t

    type IndexedTraversal1 i s t a b = forall f p g h. (Indexable i p g h, Apply f) => p a (f b) -> s -> f t

    type IndexedTraversal1P i s a = IndexedTraversal1 i s s a a

    type IndexedTraversalP i s a = IndexedTraversal i s s a a

    type Iso s t a b = forall p f. (Functor f, Profunctor p) => p a (f b) -> p s (f t)

    type IsoP s a = Iso s s a a

    type Lens s t a b = forall f. (Functor f) => (a -> f b) -> s -> f t

    type LensLike f s t a b = (a -> f b) -> s -> f t

    type LensLikeP f s a = LensLike f s s a a

    type LensP s a = Lens s s a a

    type MonadicFold m s a = forall f r. (Effective m r f, Applicative f) => (a -> f a) -> s -> f s

    type Optic p f s t a b = p a (f b) -> p s (f t)

    type OpticP p f s a = Optic p f s s a a

    type Optical p q f s t a b = p a (f b) -> q s (f t)

    type OpticalP p q f s a = Optical p q f s s a a

    type Over p f s t a b = p s (f b) -> s -> f t

    type OverP p f s a = Over p f s s a a

    type Prism s t a b = forall f p. (Applicative f, Choice p) => p a (f b) -> p s (f t)

    type PrismP s a = Prism s s a a

    type RelevantMonadicFold m s a = forall f r. (Effective m r f, Apply f) => (a -> f a) -> s -> f s

    type Setter s t a b = forall f. (Settable f) => (a -> f b) -> s -> f t

    type SetterP s a = Setter s s a a

    type Simple f s a = f s s a a

    type Traversal s t a b = forall f. (Applicative f) => (a -> f b) -> s -> f t

    type Traversal1 s t a b = forall f. (Apply f) => (a -> f b) -> s -> f t

    type Traversal1P s a = Traversal1 s s a a

    type TraversalP s a = Traversal s s a a



