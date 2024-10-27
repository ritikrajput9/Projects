import pandas as pd
import matplotlib.pyplot as plt

# Create the dataset
data = {
    'Month': [
        'January', 'February', 'March', 'April', 'May', 
        'June', 'July', 'August', 'September', 'October', 
        'November', 'December'
    ],
    'Average Rainfall (mm)': [
        78, 66, 77, 88, 105, 
        130, 142, 120, 90, 70, 
        65, 80
    ]
}

# Create a DataFrame
df = pd.DataFrame(data)

# Plotting the data
plt.figure(figsize=(10, 6))
plt.bar(df['Month'], df['Average Rainfall (mm)'], color='lightblue')
plt.title('Average Monthly Rainfall in a Fictional City')
plt.xlabel('Month')
plt.ylabel('Rainfall (mm)')
plt.xticks(rotation=45)
plt.grid(axis='y')

# Show the plot
plt.tight_layout()
plt.show()
