module Tp1 where

data TTree k v = E | Leaf k v | Node k (Maybe v) (TTree k v) (TTree k v) (TTree k v)

search :: Ord k => [k] -> TTree k v -> Maybe v
search xs E = Nothing
search [x] (Leaf k v) | x == k    = Just v
                      | otherwise = Nothing
search xs (Leaf k v) = Nothing
search [x] (Node k v l m r) | x == k = v
                            | x < k = search [x] l
                            | x > k = search [x] r
search (x:xs) (Node k v l m r) | x == k = search xs m
                               | x < k  = search (x:xs) l
                               | x > k  = search (x:xs) r
search [] t = Nothing

insert :: Ord k => [k] -> v -> TTree k v -> TTree k v
insert [] _ t = t
insert [x] v E = (Leaf x v)
insert (x:xs) v E = (Node x Nothing E (insert xs v E) E)
insert [x] v (Leaf k v1) | x == k = (Leaf k v)
                         | x < k  = (Node k (Just v1) (Leaf x v) E E)
                         | x > k  = (Node k (Just v1) E E (Leaf x v))
insert (x:xs) v (Leaf k v1) | x == k = (Node k (Just v1) E (insert xs v E) E)
                            | x < k  = (Node k (Just v1) (insert xs v E) E E)
                            | x > k  = (Node k (Just v1) E E (insert xs v E))
insert [x] v (Node k v1 l m r) | x == k = (Node k (Just v) l m r)
                               | x < k  = (Node k v1 (insert [x] v l) m r)
                               | x > k  = (Node k v1 l m (insert [x] v r))
insert (x:xs) v (Node k v1 l m r) | x == k = (Node k v1 l (insert xs v m) r)
                                  | x < k = (Node k v1 (insert (x:xs) v l) m r)
                                  | x > k = (Node k v1 l m (insert (x:xs) v r))

keys :: TTree k v -> [[k]]
keys E = []
keys (Leaf k _) = [[k]]
keys (Node k v l E r) = case v of 
                            Nothing -> (keys l) ++ (keys r)
                            Just v1 -> (keys l) ++ ([k] : (keys r))
keys (Node k v l m r) = case v of 
                            Nothing -> (keys l) ++ (map (k:) (keys m)) ++ (keys r)
                            Just v1 -> (keys l) ++ ([k] : (map (k:) (keys m))) ++ (keys r)

keys2 :: TTree k v -> [[k]]
keys2 t = aux t [] where
            aux :: TTree k v -> [[k]] -> [[k]]
            aux E xs = xs
            aux (Leaf k _) xs = ([k]:xs)
            aux (Node k v l E r) xs = case v of 
                                        Nothing -> (aux l . aux r) xs
                                        Just v1 -> (aux l . ([k]:) . aux r) xs
            aux (Node k v l m r) xs = case v of
                                        Nothing -> (aux l . map (k:) . aux m) xs  ++ aux r xs
                                        Just v1 -> (aux l . ([k]:) . map (k:) . aux m) xs ++ aux r xs


minimum :: Ord k => TTree k v -> TTree k v
minimum t@(Leaf k v) = t
minimum t@(Node k v E _ _ ) = t
minimum (Node k v l m l ) = minimum l

delete_minimum :: Ord k => TTree k v -> (TTree k v, TTree k v) --minimo, arbol restante
delete_minimum t@(Leaf k v) = (t, E)
delete_minimum t@(Node k v E m r) = ((Node k v E m E), r)
delete_minimum (Node k v l m r) = let (min, res) = delete_minimum l in (min, (Node k v res m r))

clave :: TTree k v -> k
clave (Leaf k _) =  k
clave (Node k _ _ _ _) = k

valor :: TTree k v -> Maybe v
valor (Leaf _ v) =  Just v
valor (Node _ v _ _ _) = v

medio :: TTree k v -> TTree k v
medio (Leaf _ _ ) = E
medio (Node _ _ _ m _ ) = m

delete :: Ord k => [k] -> TTree k v -> TTree k v
delete xs E = E
delete [x] l@(Leaf k v) | x == k = E
                        | otherwise = l
delete [x] t@(Node k v E E r) | x == k = r
                              | x < k  = t
                              | x > k  = delete [x] r
delete [x] t@(Node k v l E E) | x == k = l
                              | x > k  = t
                              | x < k  = delete [x] l
delete [x] (Node k v l E r) | x == k = let (min, res) = delete_minimum r in 
                                            (Node (clave min) (valor min) l (medio min) res)
                            | x < k = (Node k v (delete [x] l) E r)
                            | x > k = (Node k v l E (delete [x] r))
delete [x] t@(Node k v E m E) | x == k = (Node k Nothing E m E)
                              | otherwise t  



t = Node 'r' Nothing E (Node 'e' (Just 16) (Node 'a' Nothing E (Leaf 's' 1) E)
                                           (Node 'o' (Just 2) (Leaf 'd' 9)
                                                               E
                                                              (Leaf 's' 4))
                                            E)
                       (Node 's' Nothing E (Node 'i' (Just 4) (Leaf 'e' 8)
                                                              (Leaf 'n' 7)
                                                               E)
                       E)



