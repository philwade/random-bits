"""
The numbers on a telephone keypad are arranged thus:

    1 2 3
    4 5 6
    7 8 9
      0

Starting from the digit 1, and choosing successive digits as a knight moves in chess, determine how many different paths can be formed of length n. There is no need to make a list of the paths, only to count them.

A knight moves two steps either horizontally or vertically followed by one step in the perpendicular direction; thus, from the digit 1 on the keypad a knight can move to digits 6 or 8, and from the digit 4 on the 
keypad a knight can move to digits 3, 9 or 0. A path may visit the same digit more than once.

Problem comes from programming praxis: http://programmingpraxis.com/2012/01/20/knights-on-a-keypad/
"""

import sys

route = {
    '1' : [6, 8],
    '2' : [7, 9],
    '3' : [4, 8],
    '4' : [0, 3, 9],
    #'5' : None, #we don't ever get to five
    '6' : [7, 1, 0],
    '7' : [6, 2],
    '8' : [3, 1],
    '9' : [4, 2],
    '0' : [4, 6],
}

def knight(start, n):
    sum = 0
    if n == 1:
        return len(route[str(start)])
    else:
        print route[str(start)]
        for i in route[str(start)]:
            sum += knight(i, n - 1)
        return sum


if __name__ == "__main__":
    print knight(1, int(sys.argv[1]))
