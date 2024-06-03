def count(list):
  if list == []:
    return 0
  return 1 + count(list[1:])
    
my_list = [1, 2, 3, 4, 4, 3, 2, 2]
print(count(my_list))