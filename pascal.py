import sys

def pas(n):
    if(n == 1):
        return [1]
    else:
        prev = pas(n - 1)
        row = [1]
        for i in range(1, n):
            try:
                val = prev[i - 1] + prev[i]
            except IndexError:
                val = 1
            row.append(val)
        return row

if __name__ == "__main__":
    print pas(int(sys.argv[1]))
