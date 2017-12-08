def MaximumConSum(arr):
    currentMax = arr[0]
    currentSum = 0
    for i in range(0, len(arr)):
        if currentSum + arr[i] < 0:
            currentSum = 0
        else:
            currentSum += arr[i]
            currentMax = max(currentMax, currentSum)
    return currentMax

test1 = [7, 8, 9]
test2 = [-1, 7, 8, 9, -10]
test3 = [2, 3, -10, 9, 2]
test4 = [2, 11, -10, 9, 2]
test5 = [12, -10, 7, -8, 4, 6]

print(MaximumConSum(test1))
print(MaximumConSum(test2))
print(MaximumConSum(test3))
print(MaximumConSum(test4))
print(MaximumConSum(test5))
