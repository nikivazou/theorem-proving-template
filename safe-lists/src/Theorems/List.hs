{-@ LIQUID "--higherorder"    @-}
{-@ LIQUID "--exact-data-con" @-}

{-@ LIQUID "--automatic-instances=liquidinstanceslocal" @-}

module Theorems.List where 

import Prelude hiding (length, map, (++), (^))

import Data.List 
-- NV TODO: the infix annotation is not imported by the above module
{-@ infix   ++ @-}
{-@ infix   ^  @-}
import Data.Misc 

import Language.Haskell.Liquid.ProofCombinators 

-------------------------------------------------------------------------------
-- | Explicit, paper and pencil proofs ----------------------------------------
-------------------------------------------------------------------------------

-- | Left Identity
appendNilId     :: L a -> Proof
{-@ appendNilId ::  xs:_ -> { xs ++ N = xs } @-}
appendNilId N        
  =   N ++ N 
  ==. N 
  *** QED  
appendNilId (C x xs)
   =   (C x xs) ++ N 
   ==. C x (xs ++ N) 
   ==. C x xs        ? appendNilId xs 
   *** QED 

-- | Ignore the proof at runtime: 
-- | appendNilId is a theorem that could be used to prove properties in your code
-- | appendNilId is also an expensive recursive function. 
-- | At runtime appendNilId always provably returns the Haskell value (), 
-- | so no need to recurse at runtime 

{-# RULES "appendNilId/runtime"  forall xs. appendNilId xs = () #-}
{-# NOINLINE  appendNilId #-}

-------------------------------------------------------------------------------
-- | Automatic Proofs ---------------------------------------------------------
-------------------------------------------------------------------------------

-- | Associativity proofs automated by automatic-instances
{-@ automatic-instances appendAssoc @-}
appendAssoc :: L a -> L a -> L a -> Proof
{-@ appendAssoc :: xs:_ -> ys:_ -> zs:_ 
                -> { xs ++ (ys ++ zs) = (xs ++ ys) ++ zs } @-}
appendAssoc N _ _          = trivial
appendAssoc (C _ xs) ys zs = appendAssoc xs ys zs

{-# RULES "appendNilId/runtime"  forall xs ys zs. appendAssoc xs ys zs = () #-}
{-# NOINLINE  appendAssoc #-}


-------------------------------------------------------------------------------
-- | Use proofs for efficiency ------------------------------------------------
-------------------------------------------------------------------------------

-- | Map Fusion
-- | After you actually prove mapFusion, 

{-@ mapFusion :: f:_ -> g:_ -> xs:_ 
              -> { map f (map g xs) = map (f ^ g) xs } @-}

-- | you can use it to optimize your code

{-# RULES "mapFusion/apply" forall f g xs.  map f (map g xs) = map (f ^ g) xs #-}

{-@ automatic-instances mapFusion @-}
mapFusion :: (b -> c) -> (a -> b) -> L a -> Proof
mapFusion _ _ N        = trivial 
mapFusion f g (C _ xs) = mapFusion f g xs 

{-# RULES "mapFusion/runtime"  forall f g xs. mapFusion f g xs = () #-}
{-# NOINLINE  mapFusion #-}
