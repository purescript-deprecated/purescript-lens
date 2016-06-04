## Module Optic.Laws.Lens

Valid `Lens`es should satisfy three laws.

#### `validLens`

``` purescript
validLens :: forall s a. (Eq a, Eq s) => Lens' s a -> s -> a -> a -> a -> Boolean
```

A valid `Lens` satisfies all three of the following laws.

#### `getSet`

``` purescript
getSet :: forall s a. Eq s => Lens' s a -> s -> Boolean
```

If you get a value out, and then set it immediately back,
nothing should change.

#### `setGet`

``` purescript
setGet :: forall s a. Eq a => Lens' s a -> s -> a -> Boolean
```

If you set a value, and them get it immediately out,
you should get the value you set.

#### `setSet`

``` purescript
setSet :: forall s a b. Eq s => Lens s s a b -> s -> b -> b -> Boolean
```

If you set two values, the last set is the one that matters.


