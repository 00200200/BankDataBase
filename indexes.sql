-- Czesto bedziemy wyszukiwac klienta na podstawie jego numeru PESEL
CREATE INDEX idx_customers_pesel ON Customers(PESEL);

-- Czesto bedziemy wyszukiwac kary danego klienta
CREATE INDEX idx_cards_customerid ON Cards(CustomerID);
