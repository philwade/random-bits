import sys
import random

class QuickSorter:

    def __init__(self):
        self.depth = 0
        self.complexity = 0

    def quickSort(self, set):
        self.depth += 1
        self.complexity += 1;
        if(len(set) == 1 or len(set) == 0):
            return set
    
        high = []
        low = []
        pivot = set[0] #I realize this is a bad choice
        set.remove(pivot)

        for i in set:
            self.complexity += 2
            if i > pivot:
                high.append(i)
            else:
                low.append(i)
        return self.quickSort(low) + [pivot] + self.quickSort(high)

    def inPlaceQuickSort(self, set, left, right):
        print set[left:right+1]
        if left < right:
            pivotIndex = random.randint(left, right)
            newPivot = self.partition(set, left, right, pivotIndex)
            print newPivot
            self.inPlaceQuickSort(set, left, newPivot - 1)
            self.inPlaceQuickSort(set, newPivot + 1, right)
            
    def partition(self, set, left, right, pivotIndex):
        pivotValue = set[pivotIndex]
        print "pivot value", pivotValue
        print "pivot index", pivotIndex
        set[pivotIndex] = set[right]
        set[right] = pivotValue
        swapSpot = left

        for i in range(left, right):
            if set[i] < pivotValue:
                swapValue = set[swapSpot]
                set[swapSpot] = set[i]
                set[i] = swapValue
                swapSpot += 1
        swapValue = set[swapSpot]
        set[swapSpot] = set[right]
        set[right] = swapValue

        return swapSpot

        



if __name__ == "__main__":
    q = QuickSorter()
    runset = [5, 1, 2, 3, 4]
    #print q.quickSort(runset)
    runset = [7, 5, 3, 2, 9]
    q.inPlaceQuickSort(runset, 0, len(runset) - 1)
    print runset
