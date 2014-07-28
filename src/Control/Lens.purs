module Control.Lens
  ( (..)
  -- At
  , Index()
  , IxValue()
  , ix
  -- Fold
  , filtered
  -- Getter
  , (^.)
  , use
  , view
  -- Indexed
  , imap
  , ifoldMap
  , itraverse
  , itraversed
  -- Lens
  , lens
  -- Prism
  , prism
  , prism'
  , _Left
  , _Right
  , _Just
  , _Nothing
  -- Setter
  , (%~), (.~), (+~), (-~), (*~), (/~), (||~), (&&~), (<>~), (++~), (?~)
  , argument
  , contramapped
  , mapped
  , over
  , set
  , set'
  , sets
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
  )  where

  import qualified Control.Lens.At as CLA
  import qualified Control.Lens.Fold as CLF
  import qualified Control.Lens.Getter as CLG
  import qualified Control.Lens.Indexed as CLI
  import qualified Control.Lens.Lens as CLL
  import qualified Control.Lens.Prism as CLP
  import qualified Control.Lens.Setter as CLS
  import qualified Control.Lens.Tuple as CLT
  import qualified Control.Lens.Type as Type

  -- At
  type Index a b = CLA.Index a b
  type IxValue a b = CLA.IxValue a b
  ix = CLA.ix

  -- Fold
  filtered = CLF.filtered

  -- Getter
  infixl 8 ^.
  (^.) = CLG.(^.)
  use  = CLG.use
  view = CLG.view

  -- Indexed
  imap       = CLI.imap
  ifoldMap   = CLI.ifoldMap
  itraverse  = CLI.itraverse
  itraversed = CLI.itraversed


  -- Lens
  lens = CLL.lens

  -- Prism
  prism    = CLP.prism
  prism'   = CLP.prism'
  _Left    = CLP._Left
  _Right   = CLP._Right
  _Just    = CLP._Just
  _Nothing = CLP._Nothing

  -- Setter
  infixr 4 %~
  infixr 4 .~
  infixr 4 +~
  infixr 4 -~
  infixr 4 *~
  infixr 4 /~
  infixr 4 ||~
  infixr 4 &&~
  infixr 4 <>~
  infixr 4 ++~
  infixr 4 ?~
  (%~)         = CLS.(%~)
  (.~)         = CLS.(.~)
  (+~)         = CLS.(+~)
  (-~)         = CLS.(-~)
  (*~)         = CLS.(*~)
  (/~)         = CLS.(/~)
  (||~)        = CLS.(||~)
  (&&~)        = CLS.(&&~)
  (<>~)        = CLS.(<>~)
  (++~)        = CLS.(++~)
  (?~)         = CLS.(?~)
  argument     = CLS.argument
  contramapped = CLS.contramapped
  mapped       = CLS.mapped
  over         = CLS.over
  set          = CLS.set
  set'         = CLS.set'
  sets         = CLS.sets

  -- Tuple
  infixr 6 ~
  (~) = CLT.(~)
  _1  = CLT._1
  _2  = CLT._2

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
