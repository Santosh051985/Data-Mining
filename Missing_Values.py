# Import numpy for numerical calculation
  
import numpy as np 
import matplotlib.pyplot as plt 
import pandas as pd 
# Importing Data 
  data_sets = pd.read_csv('C:\\Users\\HP\\Desktop\\Data_for_Missing_Values.csv') 
  print ("Data Head : \n", data_sets.head()) 
  print ("\n\nData Describe : \n", data_sets.describe()) 
  Input and Output Data """
data_sets.info()  
# All rows but all columns except last 
X = data_sets.iloc[:, :-1].values 
  
# All rows but only last column  
Y = data_sets.iloc[:, 3].values 
                  
print("\n\nInput : \n", X) 
print("\n\nOutput: \n", Y) 
# Handling the missing values . We will use sklearn library preprocessing package 
# Imputer class of that package 
from sklearn.preprocessing import Imputer 
  
# Using Imputer function to replace NaN 
# values with mean of that parameter value 
imputer = Imputer(missing_values = "NaN", strategy = "mean", axis = 0) 
                    
# Fitting the data, function learns the stats 
imputer = imputer.fit(X[:, 1:3]) 
  
# fit_transform() will execute those 
# stats on the input ie. X[:, 1:3] 
X[:, 1:3] = imputer.fit_transform(X[:, 1:3]) 
  
# filling the missing value with mean 
print("\n\nNew Input with Mean Value for NaN : \n", X)  
