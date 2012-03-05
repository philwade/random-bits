import sys

class QuickSorter:

    def __init__(self):
        self.depth = 0
        self.complexity = 0

    def quickSort(self, set):
        self.depth += 1
        if(len(set) == 1 or len(set) == 0):
            return set
    
        self.complexity += 1; print "select pivot"
        high = []
        low = []
        pivot = set[0]
        set.remove(pivot)

        for i in set:
            print "compare greater"
            print "compare less"
            self.complexity += 2
            if i > pivot:
                high.append(i)
            else:
                low.append(i)
        return self.quickSort(low) + [pivot] + self.quickSort(high)


if __name__ == "__main__":
    q = QuickSorter()
    runset = [1, 2, 3]
    print q.quickSort(runset)
    print q.complexity
