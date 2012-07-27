import sys

exp = sys.argv[1]
start = "("
end = ")"
starts = []

def sane(exp):
    for char in exp:
        if char == start:
            starts.append(char)
        elif char == end:
            try:
                starts.pop()
            except IndexError:
                return False
        else:
            return False
    return True

if sane(exp):
    print "good"
else:
    print "bad"
