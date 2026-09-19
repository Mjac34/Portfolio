import pandas as pd

def process_loan_account():
    df = pd.read_csv("data/raw/Raw_Loan_Account.csv", delimiter=";", dtype_backend="numpy_nullable")
    
    # From account.pdf: Inspect missing values
    print("\nNumber of NaN values per column:")
    print(df.isna().sum())
    
    # Check for duplicate AccountNumber
    account_counts = df['AccountNumber'].value_counts()
    duplicate_account = account_counts[account_counts > 1]
    print(f"\nNumber of duplicated AccountNumbers: {len(duplicate_account)}")
    if not duplicate_account.empty:
        print("Duplicated AccountNumbers:")
        print(duplicate_account)
    
    # Remove empty columns
    columns_to_drop = ['IBAN', 'BBAN', 'MaturityDate', 'RepaymentRate']
    df = df.drop(columns=columns_to_drop, errors='ignore')
    print("Remaining columns:", df.columns.tolist())
    
    # Convert date columns
    date_columns = ['OpenDate', 'CancelledDate', 'ValueDate', 'NextInvoiceDate', 'CalculatedMaturityDate']
    df[date_columns] = df[date_columns].apply(pd.to_datetime, errors='coerce')
    
    # Convert CurrentInstallmentAmount to numeric
    df['CurrentInstallmentAmount'] = df['CurrentInstallmentAmount'].astype(str).str.replace(",", "").astype(float, errors='ignore')
    
    # Standardize AccountNumber
    df['AccountNumber'] = df['AccountNumber'].astype(str).apply(lambda x: str(int(float(x.replace(",", "")))) if 'E' in x else x)
    df['AccountNumber'] = df['AccountNumber'].str.zfill(12)
    
    # Create IsActive and LoanStatus
    df['IsActive'] = df['CancelledDate'].isna().astype(int)
    df['LoanStatus'] = df['IsActive'].map({1: 'Active', 0: 'Cancelled'})
    print("Distribution of IsActive (1 = active, 0 = cancelled):")
    print(df['IsActive'].value_counts())
    
    # Assess ChannelID
    missing_ratio = df['ChannelID'].isna().mean()
    print(f"Missing values in ChannelID: {missing_ratio:.2%}")
    
    # Check duplicate AccountNumbers
    duplicate_count = df.duplicated(subset=['AccountNumber']).sum()
    print(f"Duplicate AccountNumber count: {duplicate_count}")
    
    # Save cleansed data
    df.to_csv('data/cleansed/cleansed_loan_account.csv', index=False)
    print("Saved cleansed data to cleansed_loan_account.csv.")
    
    return df

def process_loan_balances():
    df = pd.read_csv("data/raw/Raw_Loan_Balance.csv", delimiter=";", dtype_backend="numpy_nullable")
    
    # From balance.pdf: Inspect data
    print("\nData info:")
    print(df.info())
    print("\nNumber of NaN values per column:")
    print(df.isna().sum())
    
    # Analyze unique values and frequency distribution
    for col in df.columns:
        print(f"\nAnalyzing {col}")
        print("Unique values:", df[col].unique()[:10])
        print("Most frequent values:", df[col].value_counts().head(10))
        print("-" * 50)
    
    #Remove empty columns
    columns_to_drop = ['IBAN', 'BBAN', 'MaturityDate', 'RepaymentRate']
    df = df.drop(columns=columns_to_drop, errors='ignore')
    print("Remaining columns after cleanup:", df.columns.tolist())

    # Convert BalanceDateId to datetime
    df['BalanceDateId'] = pd.to_datetime(df['BalanceDateId'], format='%Y%m%d', errors='coerce')
    
    # Convert numeric columns with commas to float
    numeric_columns = ['Balance', 'AccruedInterest', 'AccruedInterestSEK', 'BalanceSek']
    for col in numeric_columns:
        try:
            df[col] = df[col].astype(str).str.replace(",", "").astype(float)
        except Exception as e:
            print(f"Error converting {col}: {e}")
    
    # Handle NaN in PrecedingId and convert to int
    df['PrecedingId'] = df['PrecedingId'].fillna(0).astype(int)
    
    # Verify updated data types
    print("\nUpdated data types:")
    print(df.dtypes)
    
    # Save the cleaned dataset as a CSV file
    df.to_csv("data/cleansed/cleansed_loan_balance.csv", index=False)
    print("Saved cleansed data to cleansed_loan_balance.csv.")
    
    return df

def process_loan_transactions():
    df = pd.read_csv("data/raw/Raw_Loan_Transaction.csv", delimiter=";", dtype_backend="numpy_nullable")
    
    # From transaction.pdf: Inspect data
    print("\nInspecting Loan Transactions Data:")
    print(df.head())
    print("\nData info:")
    print(df.info())
    print("\nNumber of NaN values per column:")
    print(df.isna().sum())
    
    # Analyze unique values and frequency distribution
    for col in df.columns:
        print(f"\nAnalyzing {col}")
        print("Unique values:", df[col].unique()[:10])
        print("Most frequent values:", df[col].value_counts().head(10))
        print("-" * 50)
    
    # Identify and drop empty columns
    empty_columns = df.columns[df.isna().all()].tolist()
    print("\nColumns that are completely empty:", empty_columns)
    df = df.drop(columns=empty_columns, errors='ignore')
    
    # Convert numeric columns with commas to float
    numeric_columns = ['TransactionAmount', 'TransactionAmountSEK']
    for col in numeric_columns:
        try:
            df[col] = df[col].astype(str).str.replace(",", "").astype(float)
        except Exception as e:
            print(f"Error converting {col}: {e}")
    
    # Verify updated data types
    print("\nUpdated data types:")
    print(df.dtypes)
    
    # Save cleansed data
    df.to_csv('data/cleansed/cleansed_loan_transactions.csv', index=False)
    print("Saved cleansed data to cleansed_loan_transactions.csv.")
    
    return df

# Step 2: Create analytical tables (Fact & Dimension)
def create_fact_and_dimension_tables(account, balance, transaction):
 
    # Fact Table: Loan Balances
    fact_loan_balance = balance[['LoanAccountId', 'BalanceDateId', 'Balance', 'BalanceSek']].copy()
    
    # Fact Table: Transactions
    fact_transactions = transaction[['LoanAccountTransactionId', 'TransactionDateId', 'LoanAccountId', 'TransactionAmount', 'TransactionAmountSEK']].copy()
    
    # Dimension Tables
    dim_LoanAccount = account[['LoanAccountId', 'ProductId', 'AccountCurrencyId', 'LoanStatus']].drop_duplicates()
    dim_Products = account[['ProductId', 'Product']].drop_duplicates()
    dim_Currency = account[['AccountCurrencyId', 'AccountCurrency']].drop_duplicates()
    
    return fact_loan_balance, fact_transactions, dim_LoanAccount, dim_Products, dim_Currency

# Step 3: Run the pipeline
def run_pipeline():
    try:
        print("Starting pipeline execution...")
        
        # Process data
        account = process_loan_account()
        balance = process_loan_balances()
        transaction = process_loan_transactions()
        
        # Create fact and dimension tables
        fact_loan_balance, fact_transactions, dim_LoanAccount, dim_Products, dim_Currency = create_fact_and_dimension_tables(account, balance, transaction)
        
        # Save transformed tables
        fact_loan_balance.to_csv("data/warehouse/Fact_LoanBalance.csv", index=False)
        fact_transactions.to_csv("data/warehouse/Fact_Transactions.csv", index=False)
        dim_LoanAccount.to_csv("data/warehouse/Dim_LoanAccount.csv", index=False)
        dim_Products.to_csv("data/warehouse/Dim_Products.csv", index=False)
        dim_Currency.to_csv("data/warehouse/Dim_Currency.csv", index=False)
        
        print("Full pipeline completed successfully!")
    
    except Exception as e:
        print(f"Pipeline failed: {e}")

# Step 4: Execute pipeline
if __name__ == "__main__":
    run_pipeline()