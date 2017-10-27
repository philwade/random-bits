data Book = Book Int String [String]
    deriving (Show)

type ReviewBody = String
type CustomerId = Int
data BookReview = BookReview Book CustomerId ReviewBody
    deriving (Show)

getId (Book id name authors) = id

data Customer = Customer {
    customerId  :: CustomerId,
    customerName :: String
} deriving(Show)

customer1 = Customer { customerId = 123, customerName = "Dan" }

data List a = Cons a (List a)
    | Nil
    deriving (Show)

fromList (x:xs) = Cons x (fromList xs)
fromList [] = Nil

fromCons (Cons x xs) = x:fromCons xs
fromCons Nil = []

data Tree a = Node a (Tree a) (Tree a)
    | Empty
    deriving (Show)

data Tree2 a = Node2 (Maybe a) (Maybe a) (Maybe a)
    deriving (Show)
