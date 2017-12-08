def BestStock(arr):
    if len(arr) <= 1:
        return 0
    min_stock_price = arr[0]
    max_profit = 0

    for i in range(1, len(arr)):
        min_stock_price = min(min_stock_price, arr[i])
        max_profit = max(arr[i] - min_stock_price, max_profit)
    return max_profit

print BestStock([6, 3, 2, 10, 3, 5])
