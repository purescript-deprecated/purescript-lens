# PureScript-Lens

This started as an indirect port of [@ekmett][@ekmett]'s [lens][lens] library in PureScript.
It has since been broken apart and simplified a bit.
The core idea is that these are just [van Laarhoven][van Laarhoven] lenses.
Read about them as they were called [functional references][functional references].
[SPJ][SPJ] gave a brilliant introductory talk about them [here][SPJ-talk].
If you're confused, I'd recommend [SPJ][SPJ]'s talk first.
[@ekmett][@ekmett] has talked about them many times, [here's one][ekmett-talk].
For more documentation, you should look at [lens][lens].

__Disclaimer:__
Not much is here at the moment, and it's got some problems. 
It's mostly just the `Getter` and `Setter` part of [lens][lens].
The more basic examples work. But, not expect the full expressivity of the actual [lens][lens] library.

## Installation

This is available on bower, so you should be able to just:

```shell
bower i purescript-lens
```

to install it.

## Usage

You *should* be able to import just `Optic.Lens` and have most of what you need. See each directory for a summary of the available functions.

There is no TemplateHaskell like syntax so you must define each lens individually.

----------

### Warning
Currently, [PureScript][PureScript] doesn't infer constraints [#202][#202].
If you can fix it, please help out with it.

What this means for you is that you have to annotate your lens/prism/traversal/whatever with a type.
This might sound or look hairy, but the types aren't that hard to figure out and it'll go quite a way to show you that there's no magic going on in this library.
They're all just type synonyms actually.

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

`LensP s a` is the simple type when you don't need to change the type of your structure.

`Lens s t a b` is the type when you may want to change the type of your structure.

For example:

```purescript
data Foo = Bar String Number Boolean

fooNum :: LensP Foo Number
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
