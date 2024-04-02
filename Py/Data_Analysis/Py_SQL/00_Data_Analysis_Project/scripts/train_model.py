import os
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error
from sklearn.compose import ColumnTransformer
from sklearn.preprocessing import OneHotEncoder
import joblib

# Function to load the cleaned employee data
def load_employee_data(data_dir):
    file_path = os.path.join(data_dir, 'cleaned_employee_data.csv')
    employee_data = pd.read_csv(file_path)
    return employee_data

# Function to train the model
def train_model(X_train, y_train):
    # Initialize the linear regression model
    model = LinearRegression()
    # Train the model
    model.fit(X_train, y_train)
    return model

# Function to evaluate the model
def evaluate_model(model, X_test, y_test):
    # Make predictions on the testing set
    y_pred = model.predict(X_test)
    # Evaluate the model's performance using mean squared error
    mse = mean_squared_error(y_test, y_pred)
    return mse

def main():
    # Define the directory containing the cleaned data
    data_dir = r'C:\Users\PAWAN KALER\Downloads\03_LEARNINGS\LaughLoL\Py\Data_Analysis\Py_SQL\00_Data_Analysis_Project\data'
    
    # Load the cleaned employee data
    employee_data = load_employee_data(data_dir)
    
    # Split the data into features (X) and the target variable (y)
    X = employee_data.drop(columns=['Salary_USD'])
    y = employee_data['Salary_USD']
    
    # One-hot encode the categorical feature 'Department'
    ct = ColumnTransformer(transformers=[('encoder', OneHotEncoder(), ['Department'])], remainder='passthrough')
    X_encoded = ct.fit_transform(X)  # Fit and transform
    
    # Split the data into training and testing sets
    X_train, X_test, y_train, y_test = train_test_split(X_encoded, y, test_size=0.2, random_state=42)
    
    # Train the model
    model = train_model(X_train, y_train)
    
    # Evaluate the model
    mse = evaluate_model(model, X_test, y_test)
    print("Mean Squared Error:", mse)
    
    # Save the trained model to a file
    model_dir = 'models'
    os.makedirs(model_dir, exist_ok=True)
    model_path = os.path.join(model_dir, 'trained_model.pkl')
    joblib.dump(model, model_path)
    print("Model saved to", model_path)
    
    # Save the fitted ColumnTransformer object to a file
    ct_path = os.path.join(model_dir, 'column_transformer.pkl')
    joblib.dump(ct, ct_path)
    print("ColumnTransformer saved to", ct_path)

if __name__ == "__main__":
    main()
