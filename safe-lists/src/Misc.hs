{-@ LIQUID "--higherorder"    @-}

module Misc where

{-@ infix   o @-}
{-@ reflect o @-}
o f g x = f (g x)