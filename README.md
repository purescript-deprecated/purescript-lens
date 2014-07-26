# PureScript-Lens

This is an implementation of [@ekmett][@ekmett]'s [lens][lens] library in PureScript.
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

> set (_2.._1) 42 ("hello" ~ ("world" ~ "!!!"))
  
Tuple ("hello") (Tuple (42) ("!!!"))
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
[lens]: https://github.com/ekmett/lens/
