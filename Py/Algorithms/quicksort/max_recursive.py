def max(list):
    if list == []:
        return None
    if len(list) == 1:
        return list[0]
    else:
        sub_max = max(list[1:])
        return list[0] if list[0] > sub_max else sub_max
    
my_list = [1, 2, 3, 4, 4, 3, 2, 2]
print(max(my_list))