import pandas as pd

# Step 1: Run notebooks to clean and process data
print("Running data cleaning notebooks...")
pm.execute_notebook("Loan_Accounts.ipynb", "Loan_Accounts_Output.ipynb")
pm.execute_notebook("Loan_Balances.ipynb", "Loan_Balances_Output.ipynb")
pm.execute_notebook("Loan_Transactions.ipynb", "Loan_Transactions_Output.ipynb")
print("Data cleaning completed!")

# Step 2: Read cleansed data files
df_accounts = pd.read_csv("cleansed_loan_account.csv")
df_balances = pd.read_csv("cleansed_loan_balance.csv")
df_transactions = pd.read_csv("cleansed_loan_transactions.csv")

# Step 3: Create Fact Tables
fact_transactions = df_transactions[['LoanAccountTransactionId', 'SourceId', 'TransactionDateId',
                                     'ValueDateId', 'LoanAccountId', 'TransactionAmount', 
                                     'TransactionAmountSEK', 'TransactionReference']].copy()

fact_loan_balance = df_balances[['LoanAccountId', 'BalanceDateId', 'Balance', 'BalanceSek']].copy()

# Step 4: Create Dimension Tables
dim_LoanAccount = df_accounts[['LoanAccountId', 'SourceId', 'AccountNumber', 'AccountCurrencyId',
                               'OrganizationId', 'ChannelID', 'ProductId', 'InvoiceDay',
                               'CurrentInstallmentAmount', 'LoanStatus']].drop_duplicates()

dim_Products = df_accounts[['ProductId', 'Product']].drop_duplicates()
dim_Currency = df_accounts[['AccountCurrencyId', 'AccountCurrency']].drop_duplicates()

# Step 5: Create DimDate for time analysis
date_range = pd.date_range(start='2023-01-01', end='2025-12-31', freq='D')
dim_date = pd.DataFrame({'Date': date_range})
dim_date['Year'] = dim_date['Date'].dt.year
dim_date['Month'] = dim_date['Date'].dt.month
dim_date['Quarter'] = dim_date['Date'].dt.to_period("Q")
dim_date['Weekday'] = dim_date['Date'].dt.weekday

# Step 6: Save transformed tables for Power BI/SSAS
fact_transactions.to_csv("Fact_Transactions.csv", index=False)
fact_loan_balance.to_csv("Fact_LoanBalance.csv", index=False)
dim_LoanAccount.to_csv("Dim_LoanAccounts.csv", index=False)
dim_Products.to_csv("Dim_Products.csv", index=False)
dim_Currency.to_csv("Dim_Currency.csv", index=False)
dim_date.to_csv("DimDate.csv", index=False)

print("🚀 Analytical layer successfully updated and exported as CSV files!")
