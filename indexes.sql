-- Czesto bedziemy wyszukiwac klienta na podstawie jego numeru PESEL
CREATE INDEX idx_customers_pesel ON Customers(PESEL);

-- Czesto bedziemy wyszukiwac karty danego klienta
CREATE INDEX idx_cards_customerid ON Cards(CustomerID);

-- Dla szybszego wyszukiwania urodzin
CREATE INDEX idx_customers_birthdate ON Customers(BirthDate); 
x
-- Dla sprawdzanai salda ujemnego
CREATE INDEX idx_accounts_balance ON Accounts(Balance); 

CREATE INDEX idx_cards_expirationdate ON Cards(ExpirationDate); 

CREATE INDEX idx_transactionhistory_amount ON TransactionHistory(Amount); 

CREATE INDEX idx_loginhistory_logindate ON LoginHistory(LoginDate);

CREATE INDEX idx_transactionhistory_transactiondate ON TransactionHistory(TransactionDate); 
