from time import time
from random import randint

def quicksortComprehension(list):	
    if len(list) <= 1:	
        return list;	

    pivot = list.pop(len(list) / 2)	
    less = [i for i in list if i < pivot]	
    more = [i for i in list if i >= pivot]
    return quicksortComprehension(less) + [pivot] + quicksortComprehension(more)	

def quicksortLoop(set):
    if len(set) <= 1:
        return set

    high = []
    low = []
    pivot = set.pop(len(set) / 2)	

    for i in set:
        if i >= pivot:
            high.append(i)
        else:
            low.append(i)
    return quicksortLoop(low) + [pivot] + quicksortLoop(high)

if __name__ == "__main__":

    loopTimes = []
    compTimes = []

    for i in range(1, 1000):
        testSet = [randint(0, 100) for x in range(1000)]

        cSet = list(testSet)
        loopSet = list(testSet)

        compTime = time()
        quicksortComprehension(cSet)
        compTime = time() - compTime
        compTimes.append(compTime)

        loopTime = time()
        quicksortLoop(loopSet)
        loopTime = time() - loopTime
        loopTimes.append(loopTime)

    print "Avg with loop: ", sum(loopTimes)/1000
    print "Avg with list comprehension: ", sum(compTimes)/1000




