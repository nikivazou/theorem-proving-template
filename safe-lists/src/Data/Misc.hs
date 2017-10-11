{-@ LIQUID "--higherorder"    @-}

module Data.Misc where

import Prelude hiding ((^))

{-@ infix   ^ @-}
{-@ reflect ^ @-}
(^) :: (b -> c) -> (a -> b) -> a -> c
(^) f g x = f (g x)