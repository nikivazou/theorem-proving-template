This is a template repo for structuring Liquid Haskell proofs. 

# Listing of files in `src`:

- `Main.hs` contains your main code that uses user-defined lists,
- `Lists.hs` contains the definition of the list data type,
- `Theorems.hs` contains some theorems that lists satisfy, and
- `Misc.hs` contains helper functions.


# Checkin your code 

## Your code is automatically checked with Travis at each commit because of [.travis.yml](https://github.com/nikivazou/theorem-proving-template/blob/master/.travis.yml)

## You can check it locally using `stack` (or cabal) test that runs `liquid` on all the files listed [here](https://github.com/nikivazou/theorem-proving-template/blob/c4f70e3b77030131cb592ac59e727ad3e75cc627/safe-lists/tests/Test.hs#L16).

```
cd safe-lists/
stack install 
stack test safe-lists
```

## Or type the following commands on your terminal. **Attention** the ordering of the commands should follow the ordering of your imports.

```
cd src
stack exec -- liquid Misc.hs
stack exec -- liquid List.hs
stack exec -- liquid Theorems.hs
stack exec -- liquid Main.hs
```