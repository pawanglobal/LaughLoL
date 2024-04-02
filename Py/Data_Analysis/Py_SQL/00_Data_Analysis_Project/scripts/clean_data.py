import os
import pandas as pd

def handle_missing_values(data):
    """
    Handle missing values in the dataset.
    """
    # Check for missing values
    missing_values = data.isnull().sum()

    # Impute missing values or remove rows/columns with missing values
    # Example: data['Column'].fillna(value, inplace=True) for specific columns
    #          data.dropna(inplace=True) to remove rows with missing values

    return data

def convert_data_types(data):
    """
    Convert data types if necessary.
    """
    # Convert data types using astype() method or other conversion functions
    # Example: data['Column'] = data['Column'].astype('int') for converting to integer
    
    return data

def remove_duplicates(data):
    """
    Remove duplicate rows from the dataset.
    """
    # Check for duplicate rows
    duplicate_rows = data.duplicated()

    # Remove duplicate rows if any
    if duplicate_rows.sum() > 0:
        data = data[~duplicate_rows]
    
    return data

def clean_data(data):
    """
    Clean the dataset by handling missing values, converting data types, and removing duplicates.
    """
    # Handle missing values
    data = handle_missing_values(data)

    # Convert data types
    data = convert_data_types(data)

    # Remove duplicate rows
    data = remove_duplicates(data)

    return data

def main():
    # Load the dataset
    data_dir = r'C:\Users\PAWAN KALER\Downloads\03_LEARNINGS\LaughLoL\Py\Data_Analysis\Py_SQL\00_Data_Analysis_Project\data'
    file_path = os.path.join(data_dir, 'synthetic_employee_data.csv')
    employee_data = pd.read_csv(file_path)

    # Clean the dataset
    cleaned_data = clean_data(employee_data)

    # Save the cleaned dataset
    cleaned_file_path = os.path.join(data_dir, 'cleaned_employee_data.csv')
    cleaned_data.to_csv(cleaned_file_path, index=False)
    print("Cleaned dataset saved to:", cleaned_file_path)

if __name__ == "__main__":
    main()
