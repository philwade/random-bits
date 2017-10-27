"""
Detect a cycle in a linked list. Note that the head pointer may be 'None' if the list is empty.

A Node is defined as:

"""
class Node(object):
    def __init__(self, data = None, next_node = None):
        self.data = data
        self.next = next_node
    def setNext(self, next):
        self.next = next

empty = Node()
end = Node(4)
third = Node(3, end)
second = Node(2, third)
end.setNext(second)
first = Node(1, second)

def has_cycle(head):
    if head.data == None:
        return False
    else:
        return cycle_helper(head, 1)

def cycle_helper(head, index):
    tortise = get_index(head, index)
    hare = get_index(head, index * 2)
    if hare == None or tortise == None:
        return False
    elif tortise.data == hare.data:
        return True
    else:
        return cycle_helper(head, index + 1)

def get_index(head, index):
    if index == 0:
        return head
    elif head.next == None:
        return None
    else:
        return get_index(head.next, index - 1)

def printNode(node):
    if node == None:
        print "None"
    else:
        print "Data: ", node.data
        print "Next: ", printNode(node.next)

print has_cycle(first)
print has_cycle(empty)
