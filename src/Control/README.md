# Module Documentation

## Module Control.Lens

### Types

    type AReview s t a b = Review.AReview s t a b

    type AReviewP t b = Review.AReviewP t b

    type Action m s a = Type.Action m s a

    type As a = Type.As a

    type Equality s t a b = Type.Equality s t a b

    type EqualityP s a = Type.EqualityP s a

    type Fold s a = Type.Fold s a

    type Fold1 s a = Type.Fold1 s a

    type Getter s a = Type.Getter s a

    type Index a b = At.Index a b

    type IndexPreservingAction m s a = Type.IndexPreservingAction m s a

    type IndexPreservingFold s a = Type.IndexPreservingFold s a

    type IndexPreservingFold1 s a = Type.IndexPreservingFold1 s a

    type IndexPreservingGetter s a = Type.IndexPreservingGetter s a

    type IndexPreservingLens s t a b = Type.IndexPreservingLens s t a b

    type IndexPreservingLensP s a = Type.IndexPreservingLensP s a

    type IndexPreservingMonadicFold m s a = Type.IndexPreservingMonadicFold m s a

    type IndexPreservingRelevantMonadicFold m s a = Type.IndexPreservingRelevantMonadicFold m s a

    type IndexPreservingSetter s t a b = Type.IndexPreservingSetter s t a b

    type IndexPreservingSetterP s a = Type.IndexPreservingSetterP s a

    type IndexPreservingTraversal s t a b = Type.IndexPreservingTraversal s t a b

    type IndexPreservingTraversal1 s t a b = Type.IndexPreservingTraversal1 s t a b

    type IndexPreservingTraversal1P s a = Type.IndexPreservingTraversal1P s a

    type IndexPreservingTraversalP s a = Type.IndexPreservingTraversalP s a

    type IndexedAction i m s a = Type.IndexedAction i m s a

    type IndexedFold i s a = Type.IndexedFold i s a

    type IndexedFold1 i s a = Type.IndexedFold1 i s a

    type IndexedGetter i s a = Type.IndexedGetter i s a

    type IndexedLens i s t a b = Type.IndexedLens i s t a b

    type IndexedLensLike i f s t a b = Type.IndexedLensLike i f s t a b

    type IndexedLensLikeP i f s a = Type.IndexedLensLikeP i f s a

    type IndexedLensP i s a = Type.IndexedLensP i s a

    type IndexedMonadicFold i m s a = Type.IndexedMonadicFold i m s a

    type IndexedRelevantMonadicFold i m s a = Type.IndexedRelevantMonadicFold i m s a

    type IndexedSetter i s t a b = Type.IndexedSetter i s t a b

    type IndexedSetterP i s a = Type.IndexedSetterP i s a

    type IndexedTraversal i s t a b = Type.IndexedTraversal i s t a b

    type IndexedTraversal1 i s t a b = Type.IndexedTraversal1 i s t a b

    type IndexedTraversal1P i s a = Type.IndexedTraversal1P i s a

    type IndexedTraversalP i s a = Type.IndexedTraversalP i s a

    type Iso s t a b = Type.Iso s t a b

    type IsoP s a = Type.IsoP s a

    type IxValue a b = At.IxValue a b

    type Lens s t a b = Type.Lens s t a b

    type LensLike f s t a b = Type.LensLike f s t a b

    type LensLikeP f s a = Type.LensLikeP f s a

    type LensP s a = Type.LensP s a

    type MonadicFold m s a = Type.MonadicFold m s a

    type Optic p f s t a b = Type.Optic p f s t a b

    type OpticP p f s a = Type.OpticP p f s a

    type Optical p q f s t a b = Type.Optical p q f s t a b

    type OpticalP p q f s a = Type.OpticalP p q f s a

    type Over p f s t a b = Type.Over p f s t a b

    type OverP p f s a = Type.OverP p f s a

    type Prism s t a b = Type.Prism s t a b

    type PrismP s a = Type.PrismP s a

    type RelevantMonadicFold m s a = Type.RelevantMonadicFold m s a

    type Review s t a b = Review.Review s t a b

    type ReviewP t b = Review.ReviewP t b

    type Setter s t a b = Type.Setter s t a b

    type SetterP s a = Type.SetterP s a

    type Simple f s a = Type.Simple f s a

    type Traversal s t a b = Type.Traversal s t a b

    type Traversal1 s t a b = Type.Traversal1 s t a b

    type Traversal1P s a = Type.Traversal1P s a

    type TraversalP s a = Type.TraversalP s a



