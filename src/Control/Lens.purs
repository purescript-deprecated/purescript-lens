module Control.Lens
  ( (..)
  -- At
  , Index()
  , IxValue()
  , at
  , contains
  , ix
  -- Cons
  , (<|), (|>)
  , _Cons
  , _Snoc
  , _cons
  , head
  , init
  , last
  , snoc
  , tail
  , uncons
  , unsnoc
  -- Equality
  , simple
  , simply
  -- Fold
  , (^..), (^?)
  , filtered
  , foldlOf
  , foldMapOf
  , foldOf
  , foldrOf
  , toListOf
  -- Getter
  , (^.)
  , to
  , use
  , view
  -- Indexed
  , imap
  , ifoldMap
  , itraverse
  , itraversed
  -- Iso
  , au
  , auf
  , cloneIso
  , enum
  , from
  , iso
  , mapping
  , under
  , withIso
  -- Lens
  , (#~), (<#>), (??)
  , lens
  -- Prism
  , clonePrism
  , is
  , isn't
  , matching
  , nearly
  , only
  , prism
  , prism'
  , withPrism
  , _Left
  , _Right
  , _Just
  , _Nothing
  -- Review
  , Review()
  , ReviewP()
  , AReview()
  , AReviewP()
  , (##)
  , re
  , reuse
  , reuses
  , review
  , reviews
  , unto
  , un
  -- Setter
  , (%~), (.~), (+~), (-~), (*~), (//~), (||~), (&&~), (<>~), (++~), (?~)
  , (%=), (.=), (+=), (-=), (*=), (//=), (||=), (&&=), (<>=), (++=), (?=)
  , argument
  , contramapped
  , mapped
  , over
  , set
  , set'
  , sets
  -- Traversal
  , both
  , forOf
  , sequenceOf
  , traverseOf
  -- Tuple
  , (~)
  , _1
  , _2
  -- Type
  , Action()
  , As()
  , Equality()
  , EqualityP()
  , Fold()
  , Fold1()
  , Getter()
  , IndexedAction()
  , IndexedFold()
  , IndexedFold1()
  , IndexedGetter()
  , IndexedLens()
  , IndexedLensP()
  , IndexedLensLike()
  , IndexedLensLikeP()
  , IndexedMonadicFold()
  , IndexedRelevantMonadicFold()
  , IndexedSetter()
  , IndexedSetterP()
  , IndexedTraversal()
  , IndexedTraversalP()
  , IndexedTraversal1()
  , IndexedTraversal1P()
  , IndexPreservingAction()
  , IndexPreservingFold()
  , IndexPreservingFold1()
  , IndexPreservingGetter()
  , IndexPreservingLens()
  , IndexPreservingLensP()
  , IndexPreservingMonadicFold()
  , IndexPreservingRelevantMonadicFold()
  , IndexPreservingSetter()
  , IndexPreservingSetterP()
  , IndexPreservingTraversal()
  , IndexPreservingTraversal1()
  , IndexPreservingTraversal1P()
  , IndexPreservingTraversalP()
  , Iso()
  , IsoP()
  , Lens()
  , LensP()
  , LensLike()
  , LensLikeP()
  , MonadicFold()
  , RelevantMonadicFold()
  , Optic()
  , OpticP()
  , Optical()
  , OpticalP()
  , Over()
  , OverP()
  , Prism()
  , PrismP()
  , Setter()
  , SetterP()
  , Simple()
  , Traversal()
  , TraversalP()
  , Traversal1()
  , Traversal1P()
  ) where

  import qualified Control.Lens.At as At
  import qualified Control.Lens.Cons as Cons
  import qualified Control.Lens.Equality as Equality
  import qualified Control.Lens.Fold as Fold
  import qualified Control.Lens.Getter as Getter
  import qualified Control.Lens.Indexed as Indexed
  import qualified Control.Lens.Iso as Iso
  import qualified Control.Lens.Lens as Lens
  import qualified Control.Lens.Prism as Prism
  import qualified Control.Lens.Review as Review
  import qualified Control.Lens.Setter as Setter
  import qualified Control.Lens.Traversal as Traversal
  import qualified Control.Lens.Tuple as Tuple
  import qualified Control.Lens.Type as Type

  -- At
  type Index a b   = At.Index a b
  type IxValue a b = At.IxValue a b
  at       = At.at
  contains = At.contains
  ix       = At.ix

  -- Cons
  infixr 5 <|
  infixl 5 |>
  (<|)   = Cons.(<|)
  (|>)   = Cons.(|>)
  _Cons  = Cons._Cons
  _Snoc  = Cons._Snoc
  _cons  = Cons._cons
  head   = Cons.head
  init   = Cons.init
  last   = Cons.last
  snoc   = Cons.snoc
  tail   = Cons.tail
  uncons = Cons.uncons
  unsnoc = Cons.unsnoc

  -- Equality
  simple = Equality.simple
  simply = Equality.simply

  -- Fold
  infixl 8 ^..
  infixl 8 ^?
  (^..)     = Fold.(^..)
  (^?)      = Fold.(^?)
  filtered  = Fold.filtered
  foldlOf   = Fold.foldlOf
  foldMapOf = Fold.foldMapOf
  foldOf    = Fold.foldOf
  foldrOf   = Fold.foldrOf
  toListOf  = Fold.toListOf

  -- Getter
  infixl 8 ^.
  (^.) = Getter.(^.)
  to   = Getter.to
  use  = Getter.use
  view = Getter.view

  -- Indexed
  imap       = Indexed.imap
  ifoldMap   = Indexed.ifoldMap
  itraverse  = Indexed.itraverse
  itraversed = Indexed.itraversed

  -- Iso
  au       = Iso.au
  auf      = Iso.auf
  cloneIso = Iso.cloneIso
  enum     = Iso.enum
  from     = Iso.from
  iso      = Iso.iso
  mapping  = Iso.mapping
  under    = Iso.under
  withIso  = Iso.withIso

  -- Lens
  infixl 1 #~
  infixl 1 <#>
  infixl 1 ??
  (#~)  = Lens.(#~)
  (<#>) = Lens.(<#>)
  (??)  = Lens.(??)
  lens  = Lens.lens

  -- Prism
  clonePrism = Prism.clonePrism
  is         = Prism.is
  isn't      = Prism.isn't
  matching   = Prism.matching
  nearly     = Prism.nearly
  only       = Prism.only
  prism      = Prism.prism
  prism'     = Prism.prism'
  withPrism  = Prism.withPrism
  _Left      = Prism._Left
  _Right     = Prism._Right
  _Just      = Prism._Just
  _Nothing   = Prism._Nothing

  -- Review
  infixr 8 ##
  type Review s t a b  = Review.Review s t a b
  type ReviewP t b     = Review.ReviewP t b
  type AReview s t a b = Review.AReview s t a b
  type AReviewP t b    = Review.AReviewP t b
  (##)       = Review.(##)
  re         = Review.re
  reuse      = Review.reuse
  reuses     = Review.reuses
  review     = Review.review
  reviews    = Review.reviews
  unto       = Review.unto
  un         = Review.un

  -- Setter
  infixr 4 %~
  infixr 4 .~
  infixr 4 +~
  infixr 4 -~
  infixr 4 *~
  infixr 4 //~
  infixr 4 ||~
  infixr 4 &&~
  infixr 4 <>~
  infixr 4 ++~
  infixr 4 ?~
  infixr 4 %=
  infixr 4 .=
  infixr 4 +=
  infixr 4 -=
  infixr 4 *=
  infixr 4 //=
  infixr 4 ||=
  infixr 4 &&=
  infixr 4 <>=
  infixr 4 ++=
  infixr 4 ?=
  (%~)         = Setter.(%~)
  (.~)         = Setter.(.~)
  (+~)         = Setter.(+~)
  (-~)         = Setter.(-~)
  (*~)         = Setter.(*~)
  (//~)        = Setter.(//~)
  (||~)        = Setter.(||~)
  (&&~)        = Setter.(&&~)
  (<>~)        = Setter.(<>~)
  (++~)        = Setter.(++~)
  (?~)         = Setter.(?~)
  (%=)         = Setter.(%=)
  (.=)         = Setter.(.=)
  (+=)         = Setter.(+=)
  (-=)         = Setter.(-=)
  (*=)         = Setter.(*=)
  (//=)        = Setter.(//=)
  (||=)        = Setter.(||=)
  (&&=)        = Setter.(&&=)
  (<>=)        = Setter.(<>=)
  (++=)        = Setter.(++=)
  (?=)         = Setter.(?=)
  argument     = Setter.argument
  contramapped = Setter.contramapped
  mapped       = Setter.mapped
  over         = Setter.over
  set          = Setter.set
  set'         = Setter.set'
  sets         = Setter.sets

  -- Traversal
  both       = Traversal.both
  forOf      = Traversal.forOf
  sequenceOf = Traversal.sequenceOf
  traverseOf = Traversal.traverseOf

  -- Tuple
  infixr 6 ~
  (~) = Tuple.(~)
  _1  = Tuple._1
  _2  = Tuple._2

  infixr 9 ..
  (..) = (<<<)

  type Action m s a                             = Type.Action m s a
  type As a                                     = Type.As a
  type Equality s t a b                         = Type.Equality s t a b
  type EqualityP s a                            = Type.EqualityP s a
  type Fold s a                                 = Type.Fold s a
  type Fold1 s a                                = Type.Fold1 s a
  type Getter s a                               = Type.Getter s a
  type IndexedAction i m s a                    = Type.IndexedAction i m s a
  type IndexedFold i s a                        = Type.IndexedFold i s a
  type IndexedFold1 i s a                       = Type.IndexedFold1 i s a
  type IndexedGetter i s a                      = Type.IndexedGetter i s a
  type IndexedLens i s t a b                    = Type.IndexedLens i s t a b
  type IndexedLensP i s a                       = Type.IndexedLensP i s a
  type IndexedLensLike i f s t a b              = Type.IndexedLensLike i f s t a b
  type IndexedLensLikeP i f s a                 = Type.IndexedLensLikeP i f s a
  type IndexedMonadicFold i m s a               = Type.IndexedMonadicFold i m s a
  type IndexedRelevantMonadicFold i m s a       = Type.IndexedRelevantMonadicFold i m s a
  type IndexedSetter i s t a b                  = Type.IndexedSetter i s t a b
  type IndexedSetterP i s a                     = Type.IndexedSetterP i s a
  type IndexedTraversal i s t a b               = Type.IndexedTraversal i s t a b
  type IndexedTraversalP i s a                  = Type.IndexedTraversalP i s a
  type IndexedTraversal1 i s t a b              = Type.IndexedTraversal1 i s t a b
  type IndexedTraversal1P i s a                 = Type.IndexedTraversal1P i s a
  type IndexPreservingAction m s a              = Type.IndexPreservingAction m s a
  type IndexPreservingFold s a                  = Type.IndexPreservingFold s a
  type IndexPreservingFold1 s a                 = Type.IndexPreservingFold1 s a
  type IndexPreservingGetter s a                = Type.IndexPreservingGetter s a
  type IndexPreservingLens s t a b              = Type.IndexPreservingLens s t a b
  type IndexPreservingLensP s a                 = Type.IndexPreservingLensP s a
  type IndexPreservingMonadicFold m s a         = Type.IndexPreservingMonadicFold m s a
  type IndexPreservingRelevantMonadicFold m s a = Type.IndexPreservingRelevantMonadicFold m s a
  type IndexPreservingSetter s t a b            = Type.IndexPreservingSetter s t a b
  type IndexPreservingSetterP s a               = Type.IndexPreservingSetterP s a
  type IndexPreservingTraversal s t a b         = Type.IndexPreservingTraversal s t a b
  type IndexPreservingTraversal1 s t a b        = Type.IndexPreservingTraversal1 s t a b
  type IndexPreservingTraversal1P s a           = Type.IndexPreservingTraversal1P s a
  type IndexPreservingTraversalP s a            = Type.IndexPreservingTraversalP s a
  type Iso s t a b                              = Type.Iso s t a b
  type IsoP s a                                 = Type.IsoP s a
  type Lens s t a b                             = Type.Lens s t a b
  type LensP s a                                = Type.LensP s a
  type LensLike f s t a b                       = Type.LensLike f s t a b
  type LensLikeP f s a                          = Type.LensLikeP f s a
  type MonadicFold m s a                        = Type.MonadicFold m s a
  type RelevantMonadicFold m s a                = Type.RelevantMonadicFold m s a
  type Optic p f s t a b                        = Type.Optic p f s t a b
  type OpticP p f s a                           = Type.OpticP p f s a
  type Optical p q f s t a b                    = Type.Optical p q f s t a b
  type OpticalP p q f s a                       = Type.OpticalP p q f s a
  type Over p f s t a b                         = Type.Over p f s t a b
  type OverP p f s a                            = Type.OverP p f s a
  type Prism s t a b                            = Type.Prism s t a b
  type PrismP s a                               = Type.PrismP s a
  type Setter s t a b                           = Type.Setter s t a b
  type SetterP s a                              = Type.SetterP s a
  type Simple f s a                             = Type.Simple f s a
  type Traversal s t a b                        = Type.Traversal s t a b
  type TraversalP s a                           = Type.TraversalP s a
  type Traversal1 s t a b                       = Type.Traversal1 s t a b
  type Traversal1P s a                          = Type.Traversal1P s a
