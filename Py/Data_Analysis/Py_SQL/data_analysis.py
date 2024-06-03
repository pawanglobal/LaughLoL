import pandas as pd

# Load the synthetic employee data from the CSV file
employee_data = pd.read_csv('synthetic_employee_data.csv')

# Display the first few rows of the DataFrame
print(employee_data.head())

# Check for missing values
missing_values = employee_data.isnull().sum()
print("Missing Values:\n", missing_values)

# Handle missing values
# Option 1: Impute missing values (e.g., fill with mean, median, or mode)
employee_data['Salary_USD'].fillna(employee_data['Salary_USD'].median(), inplace=True)
employee_data['Performance_Score'].fillna(employee_data['Performance_Score'].mean(), inplace=True)

# Option 2: Remove rows with missing values
# employee_data.dropna(inplace=True)

# Verify if missing values have been handled
print("\nMissing Values after handling:\n", employee_data.isnull().sum())

# Check for duplicate rows based on all columns
duplicate_rows = employee_data.duplicated()

# Display the duplicate rows
print("Duplicate Rows:\n", employee_data[duplicate_rows])

# Compute summary statistics
summary_stats = employee_data.describe()
print(summary_stats)


import matplotlib.pyplot as plt
import seaborn as sns

# Visualize distributions of numerical features
sns.histplot(data=employee_data, x='Salary_USD', bins=20, kde=True)
plt.title('Distribution of Salary')
plt.xlabel('Salary (USD)')
plt.ylabel('Frequency')
plt.show()

sns.pairplot(employee_data, hue='Department')
plt.title('Pair Plot of Numerical Features')
plt.show()

# Explore relationships between variables
sns.pairplot(employee_data, hue='Department')
plt.title('Pair Plot of Numerical Features')
plt.show()

# # Compute correlation matrix
# correlation_matrix = employee_data.corr()
# print("Correlation Matrix:\n", correlation_matrix)


# Analyze trends and patterns
# Example: Trend plot of 'Performance_Score' over time (if applicable)
# employee_data.set_index('Joining_Date').groupby(pd.Grouper(freq='M')).mean()['Performance_Score'].plot()
# plt.title('Trend of Performance Score over Time')
# plt.xlabel('Date')
# plt.ylabel('Performance Score')
# plt.show()

# # Group data by department and calculate total sales revenue
# sales_revenue = employee_data.groupby('Department')['Sales_Revenue'].sum().reset_index()

# # Display sales revenue by department
# print("Sales Revenue by Department:\n", sales_revenue)

# # Find the department with the highest total sales revenue
# top_department = sales_revenue.loc[sales_revenue['Sales_Revenue'].idxmax()]

# # Display the top-performing department
# print("Top-Performing Department:\n", top_department)

import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('employee_data.db')

# Load DataFrame into SQLite database
employee_data.to_sql('employees', conn, if_exists='replace', index=False)

# Define SQL query
sql_query = """
            SELECT Department, AVG(Salary_USD) AS Avg_Salary
            FROM employees
            GROUP BY Department
            ORDER BY Avg_Salary DESC
            """

# Execute SQL query and retrieve results as DataFrame
result_df = pd.read_sql_query(sql_query, conn)

# Display results
print(result_df)

# Close database connection
conn.close()

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Plot histogram of salary distribution
plt.figure(figsize=(8, 6))
sns.histplot(employee_data['Salary_USD'], bins=20, kde=True)
plt.title('Salary Distribution')
plt.xlabel('Salary (USD)')
plt.ylabel('Frequency')
plt.show()

# Plot bar chart of department counts
plt.figure(figsize=(8, 6))
sns.countplot(data=employee_data, x='Department')
plt.title('Employee Count by Department')
plt.xlabel('Department')
plt.ylabel('Count')
plt.xticks(rotation=45)
plt.show()

# Plot scatter plot of salary vs. performance score
plt.figure(figsize=(8, 6))
sns.scatterplot(data=employee_data, x='Salary_USD', y='Performance_Score', hue='Department')
plt.title('Salary vs. Performance Score')
plt.xlabel('Salary (USD)')
plt.ylabel('Performance Score')
plt.legend(title='Department')
plt.show()

from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error

# Assuming 'Salary_USD' is the target variable and 'Performance_Score' is a feature
X = employee_data[['Performance_Score']]
y = employee_data['Salary_USD']

# Split data into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

# Initialize and train the linear regression model
model = LinearRegression()
model.fit(X_train, y_train)

# Make predictions on the testing set
y_pred = model.predict(X_test)

# Evaluate the model's performance using mean squared error
mse = mean_squared_error(y_test, y_pred)
print("Mean Squared Error:", mse)
