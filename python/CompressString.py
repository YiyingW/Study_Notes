def Compress(string):
    result = []
    current = string[0]
    count = 1
    for i in range(1, len(string)):
        if string[i] == current:
            count += 1
        else:
            result.append(current)
            result.append(str(count))
            current = string[i]
            count = 1
    result.append(current)
    result.append(str(count))
    return "".join(result)

print Compress("AAB")
print Compress("AAAaaa")
