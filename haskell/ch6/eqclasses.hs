class BasicEq a where
    isEqual :: a -> a -> Bool

instance BasicEq Bool where
    isEqual True True = True
    isEqual False False = True
    isEqual _ _ = False

class BasicEq2 a where
    isEqual2 :: a -> a -> Bool
    isEqual2 a b = not (isNotEqual2 a b)

    isNotEqual2 :: a -> a -> Bool
    isNotEqual2 a b = not (isEqual2 a b)

instance BasicEq2 Bool where
    isEqual2 True True = True
    isEqual2 False False = True
    isEqual2 _ _ = False
