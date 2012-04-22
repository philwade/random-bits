f = open('runs', 'r')

for line in f:
    parts = line.split(' ')
    sum = 0
    count = 0
    for part in parts:
        try:
            n = int(part)
            sum += n
            count += 1
        except ValueError:
            print part

    try:
        print sum / count
    except ZeroDivisionError:
        pass
