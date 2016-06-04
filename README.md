# purescript-lens

[![Build Status](https://travis-ci.org/purescript-contrib/purescript-lens.svg?branch=master)](https://travis-ci.org/purescript-contrib/purescript-lens)
[![Latest release](http://img.shields.io/bower/v/purescript-lens.svg)](https://github.com/purescript-contrib/purescript-lens/releases)
[![Maintainer: joneshf](https://img.shields.io/badge/maintainer-joneshf-lightgrey.svg)](http://github.com/joneshf)

- [Module Documentation](docs/Optic/)
- [Example](test/Main.purs)

This started as an indirect port of [@ekmett][@ekmett]'s [lens][lens] library in PureScript.
It has since been broken apart and simplified substantially.
The core idea is that these are just [van Laarhoven][van Laarhoven] lenses.
Read about them as they were called [functional references][functional references].
[SPJ][SPJ] gave a brilliant introductory talk about them [here][SPJ-talk].
If you're confused, I'd recommend [SPJ][SPJ]'s talk first.
[@ekmett][@ekmett] has talked about them many times, [here's one][ekmett-talk].
For more documentation, you should look at [lens][lens] and any of the lens resources online.

## Installation

This is available on bower, so you should be able to just:

```shell
bower i purescript-lens
```

to install it.

## Usage

You *should* be able to import just `Optic.Lens` and have most of what you need. 
See each directory for a summary of the available functions.

There is no TemplateHaskell like syntax so you must define each lens individually.
Or make use of [purescript-refractor][purescript-refractor], which has predefined lenses and prisms.

----------

There are two main types in this library: `Lens` and `Prism`.
Both propose a way for "getting" and "setting" values in a data type.
`Lens` is for working with product types (`Tuple`, records, fields in a data type).
`Prism` is for working with sum types (`Maybe`, `Either`, etc).
Each type proposes some way to look at a specific part of a data type.

With `Lens`, it proposes a way to look at one portion of a product type. 
E.g. the first field of a tuple, or the `foo` field of a record.

With `Prism`, it proposes a way to look at one side of a sum type.
E.g. the `Left` side of an `Either`, or the `Nothing` side of a `Maybe`.

For almost all of the types provided there are simple versions and more general versions. Using `Lens` as the example.

`Lens' s a` is the simple type when you don't need to change the type of your structure.

`Lens s t a b` is the type when you may want to change the type of your structure.

For example:

```purescript
data Foo = Bar String Number Boolean

fooNum :: Lens' Foo Number
fooNum = lens (\(Bar _ n _) -> n) (\(Bar s _ b) n -> Bar s n b)
```

This type and implementation states that the function `fooNum` is a `Lens` from the data type `Foo` to the `Number` field of it.
Since it is a simple type, it does not change the type of the `Number` field or change the type of `Foo`.

or

```purescript
foo :: forall b r a t s. Lens {foo :: a | r} {foo :: b | r} a b
foo = lens (\o -> o.foo) (\o x -> o{foo = x})
```

This type and implementation states that the function `foo` is a `Lens` from any record with at least a `foo` field of type `a` to any record with at least a `foo` field of type `b`.

So, what are the type synonyms? Some examples are:

```purescript
type Lens s t a b = forall f. (Functor f) => (a -> f b) -> s -> f t
type Lens' s a = Lens s s a a

type Prism s t a b = forall f p. (Applicative f, Choice p) => p a (f b) -> p s (f t)
type Prism' s a = Prism s s a a
```

These might seem scary, especially `Prism`, but if you squint at them properly, they look very familiar.

Let's take `Lens`, for example, and instantiate `s = [a], t = [b]`. 

Then we have some type: `forall f. (Functor f) => (a -> f b) -> [a] -> f [b]`.

Looks pretty close to `map` (from `Data.Array`). 
In fact, if we instantiate the `Functor` with `Identity`, 
we get the type isomorphic to `map`: `(a -> Identity b) -> [a] -> Identity [b]`.

With some simple unwrapping, we actually have the type of `map`.

What about `Prism`?

Let's instantiate the `Choice` to `(->)`: 
`type Prism s t a b = forall f. (Applicative f) => (a -> f b) -> s -> f t`
This looks pretty close to `traverse`.

So, there's a bunch of similarities to the `Functor` hierarchy, and that's one of the points of this library.
What these types synonyms allow is the ability to use similar idioms that work in the `Functor` hierarchy on containers that are not polymorphic in one variable.

An example of this is if you have some type: `data Foo = Foo Number`.
There's no way to define a `Functor` instance for `Foo`, 
so you cannot use `(<$>), (<*>), (>>=), (=>>), pure, extract` and friends.
But, it should be easy to see that it would be trivial to "map" over the `Number` contained within a `Foo`.

If you can define a lens for `Foo`, you can do just that

```purescript
module Foo where

  import Optic.Core ((*~), Lens'())

  data Foo = Foo Number

  _Foo :: Lens' Foo Number -- forall f. (Functor f) => (Number -> f Number) -> Foo -> f Foo
  _Foo f (Foo n) = Foo <$> f n

  doubleFoo :: Foo -> Foo
  doubleFoo = _Foo *~ 2
```

Now, this is not necessarily the least verbose option for such a trivial example, 
but it is definitely one of the more general options.
We were able to reuse plain old functions.
If we have some deeply nested structure, it is much less verbose for that situation.

## Examples

N.B. `(..)` is `(<<<)` purely for aesthetic reasons.

`foo..bar..baz..quux` looks better and reads easier than `foo<<<bar<<<baz<<<quux`.

----------

Using [purescript-refractor][purescript-refractor] for some pre-defined lenses/prisms, we can run this session.

```purescript
➜  purescript-lens git:(split) psci bower_components/purescript-*/src/**/*.purs
 ____                 ____            _       _   
|  _ \ _   _ _ __ ___/ ___|  ___ _ __(_)_ __ | |_ 
| |_) | | | | '__/ _ \___ \ / __| '__| | '_ \| __|
|  __/| |_| | | |  __/___) | (__| |  | | |_) | |_ 
|_|    \__,_|_|  \___|____/ \___|_|  |_| .__/ \__|
                                       |_|        

:? shows help

Expressions are terminated using Ctrl+D
> :i Optic.Core
> :i Optic.Refractor.Lens
> :i Data.Tuple
> (Tuple "Hello" "World")^._2
  
"World"

> (Tuple "Hello" "World") # _2.~42
  
Tuple ("Hello") (42)

> (Tuple "Hello" (Tuple "World" "!!!")) # _2.._1.~42
  
Tuple ("Hello") (Tuple (42) ("!!!"))
```

## Contributing

Please do! Issues, comments, bugs, improvements, whatever.

See the guide first: [contibuting](CONTRIBUTING.md).

I am not [@ekmett][@ekmett].
I don't have the drive to build this entire library by myself.
Nor do I have the knowledge to do so.
Any help is greatly appreciated.

If you see something wrong, 
don't hesitate to slap me around and explain why it's wrong.

[@ekmett]: https://github.com/ekmett/
[#202]: https://github.com/purescript/purescript/issues/202
[ekmett-talk]: http://youtu.be/cefnmjtAolY
[functional references]: http://twanvl.nl/blog/haskell/cps-functional-references
[lens]: https://github.com/ekmett/lens/
[PureScript]: https://github.com/purescript/purescript/
[purescript-refractor]: https://github.com/joneshf/purescript-refractor/
[SPJ]: http://research.microsoft.com/en-us/people/simonpj/
[SPJ-talk]: https://skillsmatter.com/skillscasts/4251-lenses-compositional-data-access-and-manipulation
[van Laarhoven]: http://twanvl.nl/index
