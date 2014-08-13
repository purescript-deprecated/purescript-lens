module Control.Lens.Type where

  import Control.Lens.Internal.Action (Effective)
  import Control.Lens.Internal.Setter (Settable)
  import Control.Lens.Internal.Indexed (Conjoined, Indexable)

  import Data.Contravariant (Contravariant)
  import Data.Profunctor (Profunctor)
  import Data.Profunctor.Choice (Choice)

  type Action m s a = forall f r. (Effective m r f) => (a -> f a) -> s -> f s

  type As a = EqualityP a a

  type Equality s t a b = forall f p. p a (f b) -> p s (f t)
  type EqualityP s a = Equality s s a a

  type Fold s a = forall f. (Contravariant f, Applicative f) => (a -> f a) -> s -> f s
  type Fold1 s a = forall f. (Contravariant f, Apply f) => (a -> f a) -> s -> f s

  type Getter s a = forall f. (Contravariant f, Functor f) => (a -> f a) -> s -> f s

  type IndexedAction i m s a = forall f r p g h. (Indexable i p g h, Effective m r f) => p a (f a) -> s -> f s
  type IndexedFold i s a = forall f p g h. (Indexable i p g h, Contravariant f, Applicative f) => p a (f a) -> s -> f s
  type IndexedFold1 i s a = forall f p g h. (Indexable i p g h, Contravariant f, Apply f) => p a (f a) -> s -> f s
  type IndexedGetter i s a = forall f p g h. (Indexable i p g h, Contravariant f, Functor f) => p a (f a) -> s -> f s
  type IndexedLens i s t a b = forall f p g h. (Indexable i p g h, Functor f) => p a (f b) -> s -> f t
  type IndexedLensP i s a = IndexedLens i s s a a
  type IndexedLensLike i f s t a b = forall p g h. (Indexable i p g h) => p a (f b) -> s -> f t
  type IndexedLensLikeP i f s a = IndexedLensLike i f s s a a
  type IndexedMonadicFold i m s a = forall f r p g h. (Indexable i p g h, Effective m r f, Applicative f) => p a (f a) -> s -> f s
  type IndexedRelevantMonadicFold i m s a = forall f r p g h. (Indexable i p g h, Effective m r f, Apply f) => p a (f a) -> s -> f s
  type IndexedSetter i s t a b = forall f p g h. (Indexable i p g h, Settable f) => p a (f b) -> s -> f t
  type IndexedSetterP i s a = IndexedSetter i s s a a
  type IndexedTraversal i s t a b = forall f p g h. (Indexable i p g h, Applicative f) => p a (f b) -> s -> f t
  type IndexedTraversalP i s a = IndexedTraversal i s s a a
  type IndexedTraversal1 i s t a b = forall f p g h. (Indexable i p g h, Apply f) => p a (f b) -> s -> f t
  type IndexedTraversal1P i s a = IndexedTraversal1 i s s a a

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

  type Iso s t a b = forall p f. (Functor f, Profunctor p) => p a (f b) -> p s (f t)
  type IsoP s a = Iso s s a a

  type Lens s t a b = forall f. (Functor f) => (a -> f b) -> s -> f t
  type LensP s a = Lens s s a a

  type LensLike f s t a b = (a -> f b) -> s -> f t
  type LensLikeP f s a = LensLike f s s a a

  type MonadicFold m s a = forall f r. (Effective m r f, Applicative f) => (a -> f a) -> s -> f s
  type RelevantMonadicFold m s a = forall f r. (Effective m r f, Apply f) => (a -> f a) -> s -> f s

  type Optic p f s t a b = p a (f b) -> p s (f t)
  type OpticP p f s a = Optic p f s s a a
  type Optical p q f s t a b = p a (f b) -> q s (f t)
  type OpticalP p q f s a = Optical p q f s s a a

  type Over p f s t a b = p a (f b) -> s -> f t
  type OverP p f s a = Over p f s s a a

  type Prism s t a b = forall f p. (Applicative f, Choice p) => p a (f b) -> p s (f t)
  type PrismP s a = Prism s s a a

  type Setter s t a b = forall f. (Settable f) => (a -> f b) -> s -> f t
  type SetterP s a = Setter s s a a

  type Simple f s a = f s s a a

  type Traversal s t a b = forall f. (Applicative f) => (a -> f b) -> s -> f t
  type TraversalP s a = Traversal s s a a
  type Traversal1 s t a b = forall f. (Apply f) => (a -> f b) -> s -> f t
  type Traversal1P s a = Traversal1 s s a a
