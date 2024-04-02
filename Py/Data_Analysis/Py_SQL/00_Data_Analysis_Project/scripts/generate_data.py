import pandas as pd
import numpy as np

# Set random seed for reproducibility
np.random.seed(42)

# Define the number of employees
num_employees = 1000

# Generate employee IDs
employee_ids = range(1, num_employees + 1)

# Generate departments
departments = np.random.choice(['Sales', 'Marketing', 'Finance', 'Engineering', 'HR'], size=num_employees)

# Generate salaries (in USD)
salaries = np.random.normal(loc=50000, scale=10000, size=num_employees)

# Generate performance scores (on a scale of 1 to 10)
performance_scores = np.random.randint(low=1, high=11, size=num_employees)

# Create a DataFrame to store the synthetic employee data
employee_data = pd.DataFrame({
    'Employee_ID': employee_ids,
    'Department': departments,
    'Salary_USD': salaries,
    'Performance_Score': performance_scores
})

# Display the first few rows of the DataFrame
print(employee_data.head())

# Save the synthetic dataset to a CSV file
# output_directory = r'C:\Users\PAWAN KALER\Downloads\03_LEARNINGS\LaughLoL\Py\Data_Analysis\Py_SQL\00_Data_Analysis_Project\data'

# Save the CSV file to the specified directory
employee_data.to_csv(r'C:\Users\PAWAN KALER\Downloads\03_LEARNINGS\LaughLoL\Py\Data_Analysis\Py_SQL\00_Data_Analysis_Project\data\synthetic_employee_data.csv', index=False)

print("Dataset saved to synthetic_employee_data.csv")
