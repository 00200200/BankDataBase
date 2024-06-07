-- Example Queries

-- Query 1: Show all information about a customer by their PESEL number
SELECT * FROM vw_customer_info
WHERE PESEL = '12345678901';

-- Query 2: Retrieve all transactions made by a card by its ID
SELECT * FROM vw_card_transactions
WHERE CardID = 1;

-- Query 3: Login history for a specific customer
SELECT * FROM vw_login_history 
WHERE CustomerID = 1;

-- Query 4: Retrieve all transactions exceeding a certain amount
SELECT * FROM vw_card_transactions 
WHERE Amount > 10000.00;

-- Query 5: Transactions made in a specific month for a specific card
SELECT * FROM vw_card_transactions 
WHERE TO_CHAR(TransactionDate, 'YYYY-MM') = '2024-05' AND CardID = 1;

-- Query 6: Total number of logins for a specific date
SELECT COUNT(*) AS TotalLogins 
FROM LoginHistory 
WHERE TO_CHAR(LoginDate, 'yyyy-mm-dd') = '2024-06-7';

-- Query 7: Customers whose cards will expire in 7 days
SELECT c.CustomerID, c.FirstName, c.LastName, cd.CardNumber, cd.ExpirationDate
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
WHERE cd.ExpirationDate < SYSDATE + INTERVAL '7' DAY;

-- Query 8: Customers who spent the most in a given month
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(t.Amount) AS TotalSpent
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
JOIN TransactionHistory t ON cd.CardID = t.CardID
WHERE TO_CHAR(t.TransactionDate, 'YYYY-MM') = TO_CHAR(SYSDATE, 'YYYY-MM')
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

-- Query 9: Customers without cards
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
LEFT JOIN Cards cd ON c.CustomerID = cd.CustomerID
WHERE cd.CustomerID IS NULL;

-- Query 10: Customers who did not make any transactions in the last month !!!! SPRAWDZIC
SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
LEFT JOIN TransactionHistory t ON cd.CardID = t.CardID
WHERE t.TransactionDate IS NULL OR t.TransactionDate < ADD_MONTHS(SYSDATE, -1);

-- Query 11: Branches and the number of accounts associated with them
SELECT b.BranchName, COUNT(a.AccountID) AS NumberOfAccounts
FROM Branches b
JOIN Accounts a ON b.BranchID = a.BranchID
GROUP BY b.BranchName;

-- Query 12: Display the balance of a specific account
SELECT Balance FROM Accounts
WHERE AccountID = 1;

-- Query 13: Display transactions made by a specific customer
SELECT 
    th.TransactionID, 
    th.TransactionDate, 
    th.Amount, 
    th.MerchantName
FROM 
    TransactionHistory th
JOIN 
    Cards c ON th.CardID = c.CardID
JOIN 
    Customers cu ON c.CustomerID = cu.CustomerID
WHERE 
    cu.CustomerID = 1;

-- Query 14: Display customers who have negative balances
SELECT 
    c.CustomerID, 
    c.FirstName, 
    c.LastName, 
    a.AccountNumber, 
    a.Balance
FROM 
    Customers c
JOIN 
    CustomerAccounts ca ON c.CustomerID = ca.CustomerID
JOIN 
    Accounts a ON ca.AccountID = a.AccountID
WHERE 
    a.Balance < 0;

-- Query 15: Display customers who have birthdays today
SELECT 
    CustomerID, 
    FirstName, 
    LastName, 
    BirthDate
FROM 
    Customers
WHERE 
    TO_CHAR(BirthDate, 'MM-DD') = TO_CHAR(SYSDATE, 'MM-DD');

-- Query 16: Display branches and their managers
SELECT b.BranchName, b.BranchAddress, e.FirstName, e.LastName, e.Email, e.Phone
FROM Branches b
JOIN Employees e ON b.BranchID = e.BranchID
JOIN Positions p ON e.PositionID = p.PositionID
WHERE p.PositionName = 'Menedżer';





-- UZYCIE --


-- Zapytanie 1: Wyświetlenie wszystkich informacji o kliencie na podstawie numeru PESEL
SELECT * FROM vw_customer_info
WHERE PESEL = '12345678901';

-- Zapytanie 2: Pobranie wszystkich transakcji wykonanych przez kartę na podstawie jej ID 
SELECT * FROM vw_card_transactions
WHERE CardID = 1;

-- Zapytanie 3: Historia logowania dla określonego klienta
SELECT * FROM vw_login_history WHERE CustomerID = 1;

-- Zapytanie 4: Pobranie wszystkich transakcji przekraczających określoną kwotę
SELECT * FROM vw_card_transactions 
WHERE Amount > 100.00;

-- Zapytanie 5: Transakcje wykonane w danym miesiącu dla konkretnej karty
SELECT * FROM vw_card_transactions 
WHERE TO_CHAR(TransactionDate, 'YYYY-MM') = '2024-05' AND CardID = 1;

-- Zapytanie 6: Łączna liczba logowań klientów dla określonej daty
SELECT CustomerID, COUNT(*) AS TotalLogins 
FROM LoginHistory 
WHERE TO_CHAR(LoginDate, 'yyyy-mm-dd') = '2024-06-06' AND CustomerID = 1
GROUP BY CustomerID;

-- Zapytanie 7: Klienci, których karty będą przeterminowane za 7 dni
SELECT c.CustomerID, c.FirstName, c.LastName, cd.CardNumber, cd.ExpirationDate
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
WHERE cd.ExpirationDate < SYSDATE + INTERVAL '7' DAY;

-- Zapytanie 8: Klienci, którzy wydali najwięcej w danym miesiącu !! Sprawdzic
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(t.Amount) AS TotalSpent
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
JOIN TransactionHistory t ON cd.CardID = t.CardID
WHERE TO_CHAR(t.TransactionDate, 'YYYY-MM') = TO_CHAR(SYSDATE, 'YYYY-MM')
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

-- Zapytanie 9: Klienci bez kart
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
LEFT JOIN Cards cd ON c.CustomerID = cd.CustomerID
WHERE cd.CustomerID IS NULL;

-- Zapytanie 10: Klienci, którzy nie wykonali żadnych transakcji w ciągu ostatniego miesiąca !!! SPRAWDZIC
SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
LEFT JOIN TransactionHistory t ON cd.CardID = t.CardID
WHERE t.TransactionDate IS NULL OR t.TransactionDate < ADD_MONTHS(SYSDATE, -1);

-- Zapytanie 11: Oddziały i liczba przypisanych do nich kont
SELECT b.BranchName, COUNT(a.AccountID) AS NumberOfAccounts
FROM Branches b
JOIN Accounts a ON b.BranchID = a.BranchID
GROUP BY b.BranchName;

-- Zapytanie 12: Wyświetlenie salda konkretnego konta
SELECT Balance FROM Accounts
WHERE AccountID = 1;

-- Zapytanie 13: Wyświetlenie transakcji wykonanych przez konkretnego klienta
SELECT 
    th.TransactionID, 
    th.TransactionDate, 
    th.Amount, 
    th.MerchantName
FROM 
    TransactionHistory th
JOIN 
    Cards c ON th.CardID = c.CardID
JOIN 
    Customers cu ON c.CustomerID = cu.CustomerID
WHERE 
    cu.CustomerID = 1;

-- Zapytanie 14: Wyświetlenie klientów, którzy mają saldo ujemne
SELECT 
    c.CustomerID, 
    c.FirstName, 
    c.LastName, 
    a.AccountNumber, 
    a.Balance
FROM 
    Customers c
JOIN 
    CustomerAccounts ca ON c.CustomerID = ca.CustomerID
JOIN 
    Accounts a ON ca.AccountID = a.AccountID
WHERE 
    a.Balance < 0;

-- Zapytanie 15: Wyświetlenie klientów, którzy mają dzisiaj urodziny
SELECT 
    CustomerID, 
    FirstName, 
    LastName, 
    BirthDate
FROM 
    Customers
WHERE 
    TO_CHAR(BirthDate, 'MM-DD') = TO_CHAR(SYSDATE, 'MM-DD');

-- Zapytanie 16: Wyświetlenie oddziałów i ich menedżerów
SELECT b.BranchName, b.BranchAddress, e.FirstName, e.LastName, e.Email, e.Phone
FROM Branches b
JOIN Employees e ON b.BranchID = e.BranchID
JOIN Positions p ON e.PositionID = p.PositionID
WHERE p.PositionName = 'Menedżer';
