"""
Today's exercise comes to us from the book Structure and Interpretation of Computer Programs by Abelson and Sussman (exercise 1.3):

Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

Your task is to write the indicated function. When you are finished, you are welcome to read or run a suggested solution, or to post your own solution or discuss the exercise in the comments below.

http://programmingpraxis.com/2012/03/16/sum-of-squares-of-two-largest-of-three-values/
"""
import sys

def sumSqs(a, b, c):
    if a > b:
        if c > b:
            return a**2 + c**2
        else:
            return a**2 + b**2
    else:
        if c > a:
            return b**2 + c**2
        else:
            return b**2 + a**2


if __name__ == "__main__":
    print sumSqs(int(sys.argv[1]), int(sys.argv[2]), int(sys.argv[3]))
