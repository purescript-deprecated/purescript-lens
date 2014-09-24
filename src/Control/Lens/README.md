# Module Documentation

## Module Control.Lens.At

### Types

    type Index a b = b

    type IxValue a b = b


### Type Classes

    class (Ixed m a b) <= At m a b where
      at :: Index m a -> LensP m (Maybe (IxValue m b))

    class Contains m a where
      contains :: Index m a -> LensP m Boolean

    class Ixed m a b where
      ix :: Index m a -> TraversalP m (IxValue m b)


### Type Class Instances

    instance atMapKVKV :: (Ord k) => At (M.Map k v) k v

    instance atMaybe :: At (Maybe a) Unit a

    instance atSetKKUnit :: (Ord k) => At (S.Set k) k Unit

    instance atStrMapV :: At (SM.StrMap v) String v

    instance containsSetK :: (Ord k) => Contains (S.Set k) k

    instance ixedArrEAEA :: (Eq e) => Ixed (e -> a) e a

    instance ixedArrayaNumberA :: Ixed [a] Number a

    instance ixedIdentityAAA :: Ixed (Identity a) Unit a

    instance ixedMapKVKV :: (Ord k) => Ixed (M.Map k v) k v

    instance ixedMaybeAUnitA :: Ixed (Maybe a) Unit a

    instance ixedMaybeUnitUnitA :: Ixed (Maybe Unit) Unit a

    instance ixedSetKKUnit :: (Ord k) => Ixed (S.Set k) k Unit

    instance ixedStrMapStringV :: Ixed (SM.StrMap v) String v


### Values


## Module Control.Lens.Cons

### Type Classes

    class Cons s t a b where
      _Cons :: Prism (s a) (t b) (Tuple a (s a)) (Tuple b (t b))

    class Snoc s t a b where
      _Snoc :: Prism (s a) (t b) (Tuple (s a) a) (Tuple (t b) b)


### Type Class Instances

    instance consArray :: Cons Prim.Array Prim.Array a b

    instance snocArray :: Snoc Prim.Array Prim.Array a b


### Values

    (<|) :: forall a s. (Cons s s a a) => a -> s a -> s a

    (|>) :: forall a s. (Snoc s s a a) => s a -> a -> s a

    _cons :: forall a s. (Cons s s a a) => a -> s a -> s a

    head :: forall a s. (Cons s s a a) => TraversalP (s a) a

    init :: forall a s. (Snoc s s a a) => TraversalP (s a) (s a)

    last :: forall a s. (Snoc s s a a) => TraversalP (s a) a

    snoc :: forall a s. (Snoc s s a a) => s a -> a -> s a

    tail :: forall a s. (Cons s s a a) => TraversalP (s a) (s a)

    uncons :: forall a s. (Cons s s a a) => s a -> Maybe (Tuple a (s a))

    unsnoc :: forall a s. (Snoc s s a a) => s a -> Maybe (Tuple (s a) a)


## Module Control.Lens.Equality

### Values

    simply :: forall p f s a r. (OpticP p f s a -> r) -> OpticP p f s a -> r


## Module Control.Lens.Fold

### Values

    (^..) :: forall a s. s -> Getting (Endo [a]) s a -> [a]

    (^?) :: forall a s. s -> Getting (First a) s a -> Maybe a

    filtered :: forall f a p. (Applicative f, Choice p) => (a -> Boolean) -> OpticP p f a a

    foldMapOf :: forall r a s p. (Profunctor p) => Accessing p r s a -> p a r -> s -> r

    foldOf :: forall a s. Getting a s a -> s -> a

    foldlOf :: forall r a s. Getting (Dual (Endo r)) s a -> (r -> a -> r) -> r -> s -> r

    foldrOf :: forall r a s p. (Profunctor p) => Accessing p (Endo r) s a -> p a (r -> r) -> r -> s -> r

    toListOf :: forall a s. Getting (Endo [a]) s a -> s -> [a]


## Module Control.Lens.Getter

### Types

    type Accessing p m s a = p a (Const m a) -> s -> Const m s

    type Getting r s a = (a -> Const r a) -> s -> Const r s


### Values

    (^.) :: forall s a. s -> Getting a s a -> a

    to :: forall a s f p. (Conjoined p Identity Identity, Contravariant f, Functor f, Profunctor p) => (s -> a) -> p a (f a) -> p s (f s)

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


## Module Control.Lens.Iso

### Types

    type AnIso s t a b = Exchange a b a (Identity b) -> Exchange a b s (Identity t)

    type AnIsoP s a = AnIso s s a a


### Values

    au :: forall b e a t s. AnIso s t a b -> ((b -> t) -> e -> s) -> e -> a

    auf :: forall p s t a b e r. (Profunctor p) => AnIso s t a b -> (p r a -> e -> b) -> p r s -> e -> t

    cloneIso :: forall f p s t a b. (Profunctor p, Functor f) => AnIso s t a b -> p a (f b) -> p s (f t)

    enum :: forall a. (Enum a, Monoid a) => IsoP Number a

    from :: forall f p s t a b. (Profunctor p, Functor f) => AnIso s t a b -> p t (f s) -> p b (f a)

    iso :: forall f p s t a b. (Profunctor p, Functor f) => (s -> a) -> (b -> t) -> p a (f b) -> p s (f t)

    mapping :: forall f g p s t a b. (Functor f, Functor g, Profunctor p) => AnIso s t a b -> p (f a) (f (g b)) -> p (f s) (f (g t))

    under :: forall s t a b. AnIso s t a b -> (t -> s) -> b -> a

    withIso :: forall b r a t s. AnIso s t a b -> ((s -> a) -> (b -> t) -> r) -> r


## Module Control.Lens.Lens

### Values

    (#~) :: forall a s. s -> State s a -> s

    (<#>) :: forall f a b. (Functor f) => f a -> (a -> b) -> f b

    (??) :: forall f a b. (Functor f) => f (a -> b) -> a -> f b

    lens :: forall s t a b. (s -> a) -> (s -> b -> t) -> Lens s t a b


## Module Control.Lens.Prism

### Types

    type APrism s t a b = Market a b a (Identity b) -> Market a b s (Identity t)

    type APrismP s a = APrism s s a a


### Values

    _Just :: forall a b. Prism (Maybe a) (Maybe b) a b

    _Left :: forall a b c. Prism (Either a c) (Either b c) a b

    _Nothing :: forall a b. PrismP (Maybe a) Unit

    _Right :: forall a b c. Prism (Either a b) (Either a c) b c

    clonePrism :: forall f p s t a b. (Applicative f, Choice p) => APrism s t a b -> p a (f b) -> p s (f t)

    is :: forall s t a b. APrism s t a b -> s -> Boolean

    isn't :: forall s t a b. APrism s t a b -> s -> Boolean

    matching :: forall s t a b. APrism s t a b -> s -> Either t a

    nearly :: forall a. a -> (a -> Boolean) -> PrismP a Unit

    only :: forall a. (Eq a) => a -> PrismP a Unit

    prism :: forall f p s t a b. (Applicative f, Choice p) => (b -> t) -> (s -> Either t a) -> p a (f b) -> p s (f t)

    prism' :: forall s a b. (b -> s) -> (s -> Maybe a) -> Prism s s a b

    withPrism :: forall b r a t s. APrism s t a b -> ((b -> t) -> (s -> Either t a) -> r) -> r


## Module Control.Lens.Review

### Types

    type AReview s t a b = Optic Tagged Identity s t a b

    type AReviewP t b = AReview t t b b

    type Review s t a b = forall p f. (B.Bifunctor p, Profunctor p, Settable f) => Optic p f s t a b

    type ReviewP t b = Review t t b b

    newtype Void where
      Void :: Void -> Void


### Values

    (##) :: forall s t a b. AReview s t a b -> b -> t

    absurd :: forall a. Void -> a

    re :: forall s t a b. AReview s t a b -> Getter b t

    reuse :: forall m b a t s. (Monad m, MonadState b m) => AReview s t a b -> m t

    reuses :: forall m b r a t s. (Monad m, MonadState b m) => AReview s t a b -> (t -> r) -> m r

    review :: forall m b a t s. (Monad m, MonadReader b m) => AReview s t a b -> m t

    reviews :: forall m b r a t s. (Monad m, MonadReader b m) => AReview s t a b -> (t -> r) -> m r

    un :: forall p f s a. (Profunctor p, B.Bifunctor p, Functor f) => Getting a s a -> OpticP p f a s

    unto :: forall p f s t a b. (Profunctor p, B.Bifunctor p, Functor f) => (b -> t) -> Optic p f s t a b


## Module Control.Lens.Setter

### Types

    type ASetter s t a b = (a -> Identity b) -> s -> Identity t

    type ASetterP s a = ASetter s s a a

    type Setting p s t a b = p a (Identity b) -> s -> Identity t

    type SettingP p s a = Setting p s s a a


### Values

    (%=) :: forall p b a m s. (Monad m, MonadState s m, Profunctor p) => Setting p s s a b -> p a b -> m Unit

    (%~) :: forall p s t a b. (Profunctor p) => Setting p s t a b -> p a b -> s -> t

    (&&=) :: forall s a m. (Monad m, MonadState s m, BoolLike a) => ASetterP s a -> a -> m Unit

    (&&~) :: forall s t a. (BoolLike a) => ASetter s t a a -> a -> s -> t

    (*=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit

    (*~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t

    (++=) :: forall s a m. (Monad m, MonadState s m, Semigroup a) => ASetterP s a -> a -> m Unit

    (++~) :: forall s t a. (Semigroup a) => ASetter s t a a -> a -> s -> t

    (+=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit

    (+~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t

    (-=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit

    (-~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t

    (.=) :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a b -> b -> m Unit

    (.~) :: forall s t a b. ASetter s t a b -> b -> s -> t

    (//=) :: forall s a m. (Monad m, MonadState s m, Num a) => ASetterP s a -> a -> m Unit

    (//~) :: forall s t a. (Num a) => ASetter s t a a -> a -> s -> t

    (<>=) :: forall s a m. (Monad m, MonadState s m, Semigroup a) => ASetterP s a -> a -> m Unit

    (<>~) :: forall s t a. (Semigroup a) => ASetter s t a a -> a -> s -> t

    (?=) :: forall b a m s. (Monad m, MonadState s m) => ASetter s s a (Maybe b) -> b -> m Unit

    (?~) :: forall s t a b. ASetter s t a (Maybe b) -> b -> s -> t

    (||=) :: forall s a m. (Monad m, MonadState s m, BoolLike a) => ASetterP s a -> a -> m Unit

    (||~) :: forall s t a. (BoolLike a) => ASetter s t a a -> a -> s -> t

    argument :: forall p r a b. (Profunctor p) => Setter (p b r) (p a r) a b

    contramapped :: forall f a b. (Contravariant f) => Setter (f a) (f b) b a

    mapped :: forall f a b. (Functor f) => Setter (f a) (f b) a b

    over :: forall p s t a b. (Profunctor p) => Setting p s t a b -> p a b -> s -> t

    set :: forall s t a b. ASetter s t a b -> b -> s -> t

    set' :: forall s a. ASetterP s a -> a -> s -> s

    sets :: forall p q f s t a b. (Profunctor p, Profunctor q, Settable f) => (p a b -> q s t) -> Optical p q f s t a b


## Module Control.Lens.Traversal

### Values

    both :: forall b a r. (Bitraversable r) => Traversal (r a a) (r b b) a b

    forOf :: forall p f s t a b. Over p f s t a b -> s -> p a (f b) -> f t

    sequenceOf :: forall p f s t a b. LensLike f s t (f b) b -> s -> f t

    traverseOf :: forall p f s t a b. Over p f s t a b -> p a (f b) -> s -> f t


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

    type IndexPreservingGetter s a = forall f p g h. (Conjoined p g h, Contravariant f, Functor f) => p a (f a) -> p s (f s)

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

    type Over p f s t a b = p a (f b) -> s -> f t

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



