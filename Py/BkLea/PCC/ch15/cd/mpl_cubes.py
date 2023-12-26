import matplotlib.pyplot as plt

#input_values = [1, 2, 3, 4, 5]
#cubes = [1, 8, 27, 64, 125]
input_values = range(1, 5001)
cubes = [x**3 for x in input_values]

plt.style.use('seaborn-v0_8')
fig, ax = plt.subplots()

#ax.plot(input_values, cubes, linewidth=3)
ax.scatter(input_values, cubes, c=input_values, cmap=plt.cm.Blues, s=10)

ax.set_title('Cubes', fontsize=24)
ax.set_xlabel('Values', fontsize=15)
ax.set_ylabel('Cubes of Values', fontsize=15)

ax.tick_params(axis='both', labelsize=14)

ax.axis([0, 5500, 0, 100000000000])

plt.show()