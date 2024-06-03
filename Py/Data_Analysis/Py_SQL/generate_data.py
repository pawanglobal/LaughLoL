import pandas as pd
import numpy as np

# Set random seed for reproducibility
np.random.seed(42)

# Define the number of employees
num_employees = 1000

# Generate employee IDs with incorrect data type (string instead of integer)
employee_ids = list(map(str, range(1, num_employees + 1)))

# Generate departments with missing values and incorrect data types
departments = np.random.choice(['Sales', 'Marketing', 'Finance', 'Engineering', 'HR', np.nan, 123, True], size=num_employees)

# Introduce NaN values in inappropriate columns (salary and performance scores)
salaries = np.random.normal(loc=50000, scale=10000, size=num_employees)
salaries[0:50] = np.nan  # Introduce missing values in the first 50 salaries

# Generate performance scores (on a scale of 1 to 10) with incorrect data type (float instead of integer)
performance_scores = np.random.uniform(low=1, high=11, size=num_employees)
performance_scores[900:910] = np.nan  # Introduce missing values in the middle of performance scores

# Create a DataFrame to store the synthetic employee data with problems
employee_data_problems = pd.DataFrame({
    'Employee_ID': employee_ids,
    'Department': departments,
    'Salary_USD': salaries,
    'Performance_Score': performance_scores
})

# Shuffle the DataFrame to introduce inconsistencies
employee_data_problems = employee_data_problems.sample(frac=1).reset_index(drop=True)

# Display the first few rows of the DataFrame
print(employee_data_problems.head())

# Save the synthetic dataset with problems to a CSV file
employee_data_problems.to_csv('synthetic_employee_data.csv', index=False)

print("Dataset with problems saved to synthetic_employee_data.csv")
