This is a template repo for structuring and checking Liquid Haskell proofs. 

# Listing of files in `src`:

- [`Main.hs`](https://github.com/nikivazou/theorem-proving-template/blob/master/safe-lists/src/Main.hs) contains your main code that uses user-defined lists,
- [`Data/List.hs`](https://github.com/nikivazou/theorem-proving-template/blob/master/safe-lists/src/Data/List.hs) contains the definition of the list data type,
- [`Data/Misc.hs`](https://github.com/nikivazou/theorem-proving-template/blob/master/safe-lists/src/Data/Misc.hs) contains helper functions, and
- [`Theorems/List.hs`](https://github.com/nikivazou/theorem-proving-template/blob/master/safe-lists/src/Theorems/List.hs) contains some theorems that lists satisfy.


# Checking your code 

## With `Travis CI`

Your theorems and code are automatically checked with Travis CI at each commit because of [.travis.yml](https://github.com/nikivazou/theorem-proving-template/blob/master/.travis.yml)

## With `stack`

You can check it locally using `stack` (or cabal) test that runs `liquid` on all the files listed [here](https://github.com/nikivazou/theorem-proving-template/blob/master/safe-lists/tests/Test.hs#L16).

```
cd safe-lists/
stack install 
stack test safe-lists
```

## Check each file

Or type the following commands on your terminal. **Attention** the ordering of the commands should follow the ordering of your imports.

```
cd src
stack exec -- liquid Data/Misc.hs
stack exec -- liquid Data/List.hs
stack exec -- liquid Theorems/List.hs
stack exec -- liquid Main.hs
```


For example, if you update `Data/List.hs` and you want to check your theorems, you need to run `liquid Data/List.hs` before you run `liquid Theorems/List.hs`.
