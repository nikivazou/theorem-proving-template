{-@ LIQUID "--higherorder"    @-}

module Data.Prelude where

{-@ infix   o @-}
{-@ reflect o @-}
o f g x = f (g x)