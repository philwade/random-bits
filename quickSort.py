import sys

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
        pivot = set[0]
        set.remove(pivot)

        for i in set:
            self.complexity += 2
            if i > pivot:
                high.append(i)
            else:
                low.append(i)
        return self.quickSort(low) + [pivot] + self.quickSort(high)

    def inPlaceQuickSort(self, set, left, right):
        if left < right:
            mid = self.partition(set, left, right)
            self.inPlaceQuickSort(set, left, mid - 1)
            self.inPlaceQuickSort(set, mid + 1, right)
            
    def partition(self, set, left, right):
        pivotIndex = (right / 2) + 1
        pivotValue = set[pivotIndex]
        print pivotValue
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
    runset = [1, 5, 7, 3, 9]
    q.inPlaceQuickSort(runset, 0, len(runset) - 1)
    print runset
