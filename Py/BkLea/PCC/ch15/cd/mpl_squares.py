import matplotlib.pyplot as plt

# Give input_values to remove default 0 value
input_values=[1, 2, 3, 4, 5]
squares = [1, 4, 9, 16, 25]

# Function ax for single plot
# Function fig for entire figure
# Function subplots can generate one or two figures in the same plot.

plt.style.use('seaborn-v0_8')
fig, ax = plt.subplots()
ax.plot(input_values, squares, linewidth=3)

# Set chart title and label axes
ax.set_title("Square Numbers", fontsize=24)
ax.set_xlabel("Value", fontsize=14)
ax.set_ylabel("Square of Value", fontsize=14)

# Set size tick labels
ax.tick_params(axis='both', labelsize=14)

plt.show()