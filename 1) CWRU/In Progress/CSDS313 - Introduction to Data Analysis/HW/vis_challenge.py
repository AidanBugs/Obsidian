import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt

# Load the data
df = pd.read_csv('data/City Stats - QOL.csv', index_col=0)

# Filter for US cities
us_cities = df[df['City'].str.contains('United States')].copy()

# Columns to normalize (all except QOL Index and City)
columns_to_normalize = ['Purchasing Power Index', 'Safety Index', 'Health Care Index', 
                      'Cost of Living Index', 'Property Price to Income Ratio', 
                      'Traffic Commute Time Index', 'Pollution Index', 'Climate Index']

positive_normalized_columns = ["Purchasing Power Index_normalized", "Safety Index_normalized", "Health Care Index_normalized", "Climate Index_normalized"]

negative_normalized_columns = ["Cost of Living Index_normalized", "Property Price to Income Ratio_normalized", "Traffic Commute Time Index_normalized", "Pollution Index_normalized"]

def quantile_normalize(df, columns):
    """
    Perform quantile normalization on specified columns
    """
    # Extract the data to normalize
    data_to_normalize = df[columns].copy()
    
    # Sort each column
    sorted_data = np.sort(data_to_normalize, axis=0)
    
    # Calculate rank means
    rank_means = sorted_data.mean(axis=1)
    
    # Get ranks for each column
    ranks = data_to_normalize.rank(method='average').astype(int) - 1
    
    # Replace values with rank means
    normalized_data = pd.DataFrame(
        np.array([rank_means[ranks[col].values] for col in columns]).T,
        columns=columns,
        index=df.index
    )
    
    return normalized_data

# Perform quantile normalization
normalized_columns = quantile_normalize(us_cities, columns_to_normalize)

# Add normalized columns back to the dataframe
for col in columns_to_normalize:
    us_cities[f'{col}_normalized'] = normalized_columns[col]

# Calculate new QOL column (100 + sum of all normalized variables)
normalized_cols = [f'{col}_normalized' for col in columns_to_normalize]
us_cities['QOL_New'] = 100 + us_cities[positive_normalized_columns].sum(axis=1) - us_cities[negative_normalized_columns].sum(axis=1)

apartment_df = pd.read_csv('data/City Stats - Apartment List.csv')

us_apartments = apartment_df[
    (apartment_df['location_type'] == 'City') & 
    (apartment_df['state'].notna()) & 
    (apartment_df['bed_size'] == 'overall')
].copy()

us_apartments = us_apartments.rename(columns={'2025_10': 'Rent_Cost'})


# Get Cleveland's data
cleveland_data = us_cities[us_cities['City'].str.contains('Cleveland')].iloc[0]

cleveland_data["Rent_Cost"] = int(us_apartments[us_apartments["location_name"].str.contains("Cleveland")]["Rent_Cost"])

# Create box plots
fig, axes = plt.subplots(2, 3, figsize=(12, 9))
fig.suptitle('Distribution of Key Metrics for US Cities (Cleveland Highlighted in Green)', fontsize=16, fontweight='bold')

bp1 = axes[0,0].boxplot(us_cities['Health Care Index'].dropna(), patch_artist=True)
bp1['boxes'][0].set_facecolor("white")
axes[0,0].scatter(1, cleveland_data['Health Care Index'], color='green', s=100, zorder=10, label='Cleveland')
axes[0,0].set_title('Health Care Index', fontweight='bold')
axes[0,0].set_ylabel('Index Value')
axes[0,0].grid(True, alpha=0.3)
axes[0,0].set_xticklabels([''])

# Plot 2: Purchasing Power Index (original)
bp2 = axes[0,1].boxplot(us_cities['Traffic Commute Time Index'].dropna(), patch_artist=True)
bp2['boxes'][0].set_facecolor("white")
axes[0,1].scatter(1, cleveland_data['Traffic Commute Time Index'], color='lime', s=100, zorder=10, label='Cleveland')
axes[0,1].set_title('Traffic Commute Time Index', fontweight='bold')
axes[0,1].set_ylabel('Index Value')
axes[0,1].grid(True, alpha=0.3)
axes[0,1].set_xticklabels([''])

# Plot 3: Property Price to Income Ratio (original)
bp3 = axes[0,2].boxplot(us_cities['Property Price to Income Ratio'].dropna(), patch_artist=True)
bp3['boxes'][0].set_facecolor("white")
axes[0,2].scatter(1, cleveland_data['Property Price to Income Ratio'], color='green', s=100, zorder=10, label='Cleveland')
axes[0,2].set_title('Property Price to Income Ratio', fontweight='bold')
axes[0,2].set_ylabel('Ratio')
axes[0,2].grid(True, alpha=0.3)
axes[0,2].set_xticklabels([''])

# Plot 4: Cost of Living Index (original)
bp4 = axes[1,0].boxplot(us_cities['Cost of Living Index'].dropna(), patch_artist=True)
bp4['boxes'][0].set_facecolor("white")
axes[1,0].scatter(1, cleveland_data['Cost of Living Index'], color='green', s=100, zorder=10, label='Cleveland')
axes[1,0].set_title('Cost of Living Index', fontweight='bold')
axes[1,0].set_ylabel('Index Value')
axes[1,0].grid(True, alpha=0.3)
axes[1,0].set_xticklabels([''])

# Plot 5: QOL (New)
bp5 = axes[1,1].boxplot(us_cities['QOL_New'].dropna(), patch_artist=True)
bp5['boxes'][0].set_facecolor("white")
axes[1,1].scatter(1, cleveland_data['QOL_New'], color='green', s=100, zorder=10, label='Cleveland')
axes[1,1].set_title('Quality of Life', fontweight='bold')
axes[1,1].set_ylabel('QOL Score')
axes[1,1].grid(True, alpha=0.3)
axes[1,1].set_xticklabels([''])

rent_data = us_apartments['Rent_Cost'].dropna()
bp6 = axes[1,2].boxplot(rent_data, patch_artist=True)
bp6['boxes'][0].set_facecolor("white")
axes[1,2].scatter(1, cleveland_data['Rent_Cost'], color='green', s=100, zorder=10, label='Cleveland')
axes[1,2].set_title('Rent Prices (Overall)', fontweight='bold')
axes[1,2].set_ylabel('Rent Cost ($)')
axes[1,2].grid(True, alpha=0.3)
axes[1,2].set_xticklabels([''])


plt.tight_layout()
plt.show()
