{-@ LIQUID "--higherorder"    @-}

module Data.Misc where

{-@ infix   o @-}
{-@ reflect o @-}
o f g x = f (g x)