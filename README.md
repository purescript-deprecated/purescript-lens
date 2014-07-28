# PureScript-Lens

This is an indirect port of [@ekmett][@ekmett]'s [lens][lens] library in PureScript.
These are just [van Laarhoven][van Laarhoven] lenses.
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

You *should* be able to import just `Control.Lens` and have most of what you need. See each directory for a summary of the available functions.

There is no TemplateHaskell like syntax so you must define each lens individually.

### Warning
Currently, [PureScript][PureScript] doesn't infer constraints [#202][#202].
If you can fix it, please help out with it.

What this means for you is that you have to annotate your lens/prism/traversal/whatever with a type.
This might sound or look hairy, but the types aren't that hard to figure out and it'll go quite a way to show you that there's no magic going on in this library.
They're almost all just type synonyms actually.

One way to think of the `Lens` type is to think of it as saying you want a lens from some structure to a piece of that structure.

`LensP s a` is the simple type when you don't need to change the type of your structure.

`Lens s t a b` is the type when you need to change the type of your structure,

For example:

```haskell
data Foo = Bar String Number Boolean

fooNum :: LensP Foo Number
fooNum = lens (\(Bar _ n _) -> n) (\(Bar s _ b) n -> Bar s n b)
```

or

```haskell
_foo :: forall b r a t s. Lens {foo :: a | r} {foo :: b | r} a b
_foo = lens (\o -> o.foo) (\o x -> o{foo = x})
```

## Examples

N.B. 
`(~)` is an infix version of `Tuple`. 

It's available in `Control.Lens.Tuple`, 
so it should come when you import `Control.Lens`.
It's right associative so beware of what structure it will create.

`(..)` is `(<<<)` purely for aesthetic reasons.

`foo..bar..baz..quux` looks better and reads easier than `foo<<<bar<<<baz<<<quux`.

```haskell
➜  purescript-lens git:(master) psci src/**/*.purs bower_components/purescript-*/src/**/*.purs
 ____                 ____            _       _   
|  _ \ _   _ _ __ ___/ ___|  ___ _ __(_)_ __ | |_ 
| |_) | | | | '__/ _ \___ \ / __| '__| | '_ \| __|
|  __/| |_| | | |  __/___) | (__| |  | | |_) | |_ 
|_|    \__,_|_|  \___|____/ \___|_|  |_| .__/ \__|
                                       |_|        

:? shows help

Expressions are terminated using Ctrl+D
> :i Control.Lens
> ("hello" ~ "world")^._2
  
...if it's the first compile, lens imports most of the universe here...

"world"

> set _2 42 ("hello" ~ "world")
  
Tuple ("hello") (42)

> ("hello" ~ ("world" ~ "!!!"))^._2.._1
  
"world"

> set (_2.._1) 42 ("hello" ~ "world" ~ "!!!")
  
Tuple ("hello") (Tuple (42) ("!!!"))
```

Or, when using records.

N.B. There's no show instance for records, so we just check the type instead.

```haskell
➜  purescript-lens git:(master) psci src/**/*.purs bower_components/purescript-*/src/**/*.purs
 ____                 ____            _       _   
|  _ \ _   _ _ __ ___/ ___|  ___ _ __(_)_ __ | |_ 
| |_) | | | | '__/ _ \___ \ / __| '__| | '_ \| __|
|  __/| |_| | | |  __/___) | (__| |  | | |_) | |_ 
|_|    \__,_|_|  \___|____/ \___|_|  |_| .__/ \__|
                                       |_|        

:? shows help

Expressions are terminated using Ctrl+D
> :i Control.Lens
> let obj = {foo: {bar: {baz: true}}}
  
> let _foo = lens (\o -> o.foo) (\o x -> o{foo = x})
  
> let _bar = lens (\o -> o.bar) (\o x -> o{bar = x})
  
> let _baz = lens (\o -> o.baz) (\o x -> o{baz = x})
  
> :t _foo
forall t13 t14 t7. Control.Lens.Type.Lens { foo :: t14 | t13 } { foo :: t7 | t13 } t14 t7
> :t _bar
forall t20 t26 t27. Control.Lens.Type.Lens { bar :: t27 | t26 } { bar :: t20 | t26 } t27 t20
> :t _baz
forall t33 t39 t40. Control.Lens.Type.Lens { baz :: t40 | t39 } { baz :: t33 | t39 } t40 t33
> obj^._foo.._bar.._baz
  
true

> :t obj
{ foo :: { bar :: { baz :: Prim.Boolean } } }
> :t _foo.._bar.._baz.~5 $ obj
{ foo :: { bar :: { baz :: Prim.Number } } }
> :t _foo.~"wat" $ obj
{ foo :: Prim.String }
> :t _foo.._bar.~[1,2,3] $ obj
{ foo :: { bar :: [Prim.Number] } }
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
[SPJ]: http://research.microsoft.com/en-us/people/simonpj/
[SPJ-talk]: https://skillsmatter.com/skillscasts/4251-lenses-compositional-data-access-and-manipulation
[van Laarhoven]: http://twanvl.nl/index
