module Strain (keep, discard) where

discard :: (a -> Bool) -> [a] -> [a]
discard _ [] = []
discard p (x:xs) = discardr (p x) p $ [x] ++ xs  

discardr :: Bool -> (a -> Bool) -> [a] -> [a]
discardr True _ [] = []
discardr False _ [] = []
discardr True p (_:xs) = discard p xs
discardr False p (x:xs) = x:discard p xs

keep :: (a -> Bool) -> [a] -> [a]
keep _ [] = []
keep p (x:xs) = keepr (p x) p $ [x] ++ xs

keepr :: Bool -> (a -> Bool) -> [a] -> [a]
keepr True _ [] = []
keepr False _ [] = []
keepr True p (x:xs) = x:keep p xs 
keepr False p (_:xs) = keep p xs

