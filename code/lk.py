def look_knave(list=[1], iter=1, base=2):
    if iter > 1:
        return look_knave(look_knave(list), iter=iter-1)
    list_lie, output = [], [ ]
    for digit in list:
        if digit in range(10):
            list_lie.append(base - 1 - digit)
    while list_lie:
        i, digit = 0, list_lie[0]
        while list_lie:
            if list_lie[0] == digit:
                i += 1
                list_lie = list_lie[1:]
            else:
                break
        for data in str(i):
            output.append(int(data))
        output.append(digit)
    return output
