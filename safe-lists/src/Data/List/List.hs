{-@ LIQUID "--higherorder"    @-}
{-@ LIQUID "--exact-data-con" @-}

{-@ LIQUID "--automatic-instances=liquidinstances" @-}

module Data.List.List where 

import Prelude hiding (length, map, (++))

data L a = N | C a (L a)
  deriving (Eq, Show)
{-@ data L [length]  @-}

{-@ measure length @-}
length :: L a -> Int 
{-@ length :: L a -> Nat @-}
length N        = 0 
length (C _ xs) = 1 + length xs 

{-@ reflect map @-}
map :: (a -> b) -> L a -> L b 
map _ N        = N 
map f (C x xs) = f x `C` map f xs 

{-@ infix   ++ @-}
{-@ reflect ++ @-}
(++) :: L a -> L a -> L a 
N        ++ ys = ys 
(C x xs) ++ ys = C x (xs ++ ys)