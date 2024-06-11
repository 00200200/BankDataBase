-- Czesto bedziemy wyszukiwac klienta na podstawie jego numeru PESEL
CREATE INDEX idx_customers_pesel ON Customers(PESEL);

-- Czesto bedziemy wyszukiwac karty danego klienta
CREATE INDEX idx_cards_customerid ON Cards(CustomerID);

-- Codziennie sprawdzamy czy ktos ma urodziny
CREATE INDEX idx_customers_birthdate ON Customers(BirthDate); 

-- Codziennie sprawdzamy czy ktos nie ma ujemnego salda
CREATE INDEX idx_accounts_balance ON Accounts(Balance); 

-- Codziennie sprawdzamy czy karty nie sa przeterminowane
CREATE INDEX idx_cards_expirationdate ON Cards(ExpirationDate); 
