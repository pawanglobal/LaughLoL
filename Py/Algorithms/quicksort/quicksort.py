def quicksort(arr):
    #base case array with 0 or 1 element already sorted.
    if len(arr) < 2:
        return arr
    #recursive case
    else:
        pivot = arr[0]
        less = [i for i in arr[1:] if i < pivot]
        greater = [i for i in arr[1:] if i > pivot]

        return quicksort(less) + [pivot] + quicksort(greater)

my_arr = [4, 2, 5, 3, 5, 2, 9, 0]
print(quicksort(my_arr))
    