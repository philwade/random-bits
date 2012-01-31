"""
    Solution to the problem found here: http://programmingpraxis.com/2012/01/31/string-rotation/
    "Write a function that takes two input strings and determines if one is a rotation of the other. For instance, “ProgrammingPraxis” and “PraxisProgramming” are rotations of each other, but “ProgrammingPrasix” is not a rotation of “ProgrammingPraxis” because the last three letters are out of order."

    First solution is my own naive one. Second is after learning the trick that any rotation is contained in a double version of the original :/
"""
import sys

def rotate_eq(string1, string2):
    if len(string1) != len(string2):
        return False
    start = string1[0]
    length = len(string1)
    match = False
    
    for i in range(0, length):
        if string2[i] == start:
            match = True
            for j in range(i, length + i):
                #print "does ", string2[j % length], " equal ", string1[j - i]
                if string2[j % length] != string1[j - i]:
                    match = False
                    break

    return match

#the easier version from programming praxis
def rotate_eq2(string1, string2):
    if len(string1) == len(string2):
        temp = string1 + string1
        if string2 in temp:
            return True
    return False

if __name__ == "__main__":
    print rotate_eq(sys.argv[1], sys.argv[2])
