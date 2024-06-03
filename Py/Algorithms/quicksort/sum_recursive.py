def sum(list):
    if list == []:
        return 0
    else:
        return list[0] + sum(list[1:])


my_list = [1, 2, 3, 4, 4, 3, 2, 2]
print(sum(my_list))

