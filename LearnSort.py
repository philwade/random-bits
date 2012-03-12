class LearnSort:	
	def quicksort(self, list):	
		if len(list) <= 1:	
			return list;	
		else:	
			pivot = list.pop(0)	
			less = [i for i in list if i < pivot]	
			more = [i for i in list if i >= pivot]
			return self.quicksort(less) + [pivot] + self.quicksort(more)	

if __name__ == "__main__":	
	s = LearnSort()
	a = [5, 4, 3, 8, 7, 3, 18]	
	print a
	print s.quicksort(a)	
