import pandas as pd
import os

def load_employee_data(data_dir):
    """
    Load synthetic employee data from CSV file into a pandas DataFrame.

    Parameters:
    - data_dir (str): Directory where the data file is located.

    Returns:
    - DataFrame: Pandas DataFrame containing the synthetic employee data.
    """
    # Construct the file path
    file_path = os.path.join(data_dir, 'synthetic_employee_data.csv')
    
    # Load the data into a DataFrame
    employee_data = pd.read_csv(file_path)
    
    return employee_data

if __name__ == "__main__":
    # Directory where the data file is located
    data_dir = '\data'
    
    # Load the data
    employee_data = load_employee_data(data_dir)
    
    # Display the first few rows of the DataFrame
    print(employee_data.head())
