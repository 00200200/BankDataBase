-- Indeksy dla tabeli Customers
CREATE INDEX idx_customers_email ON Customers(Email);
CREATE INDEX idx_customers_pesel ON Customers(PESEL);
CREATE INDEX idx_customers_idnumber ON Customers(IDNumber);
CREATE INDEX idx_customers_phone ON Customers(Phone);

-- Indeksy dla tabeli Addresses
CREATE INDEX idx_addresses_customerid ON Addresses(CustomerID);

-- Indeksy dla tabeli Employees
CREATE INDEX idx_employees_departmentid ON Employees(DepartmentID);
CREATE INDEX idx_employees_branchid ON Employees(BranchID);
CREATE INDEX idx_employees_positionid ON Employees(PositionID);

-- Indeksy dla tabeli Accounts
CREATE INDEX idx_accounts_accountnumber ON Accounts(AccountNumber);
CREATE INDEX idx_accounts_accounttypeid ON Accounts(AccountTypeID);
CREATE INDEX idx_accounts_branchid ON Accounts(BranchID);

-- Indeksy dla tabeli Cards
CREATE INDEX idx_cards_customerid ON Cards(CustomerID);
CREATE INDEX idx_cards_cardnumber ON Cards(CardNumber);

-- Indeksy dla tabeli TransactionHistory
CREATE INDEX idx_transactionhistory_cardid ON TransactionHistory(CardID);
CREATE INDEX idx_transactionhistory_transactiondate ON TransactionHistory(TransactionDate);

-- Indeksy dla tabeli LoginHistory
CREATE INDEX idx_loginhistory_customerid ON LoginHistory(CustomerID);
