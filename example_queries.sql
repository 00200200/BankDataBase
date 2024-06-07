SELECT COUNT(*) AS TotalLogins FROM LoginHistory 
WHERE TO_CHAR(LoginDate, 'yyyy-mm-dd') = '2024-06-12' ;


-- Zapytanie 1: Pokazywanie wszystkich informacji o kliencie znając jego numer pesel
SELECT * FROM vw_customer_info
WHERE PESEL = '12345678901';

-- Zapytanie 2: Pobieranie wszystkich transakcji wykonanych przez karte znając jej ID 
SELECT * FROM vw_card_transactions
WHERE CardID = '1';

-- Zapytanie 3: Historia logowania dla określonego klienta
SELECT * FROM vw_login_history WHERE CustomerID = 1;

-- Zapytanie 9: Transakcje przekraczające określoną kwotę
-- Chcemy analizować 'PODEJRZANE/Na duza kwote' transakcje 
SELECT * FROM vw_card_transactions WHERE Amount > 10000.00;

-- Zapytanie 14: Transakcje wykonane w danym miesiącu
-- To zapytanie pobiera wszystkie transakcje wykonane w określonym miesiącu. dla konkretnej karty 
SELECT * FROM vw_card_transactions WHERE TO_CHAR(TransactionDate, 'YYYY-MM') = '2023-05' AND CardID = 1;

-- Zapytanie 16: Łączna liczba logowań klientów
-- Przypuśćmy chcemy sprawdzić ile mamy dziennie 
SELECT COUNT(*) AS TotalLogins FROM LoginHistory 
WHERE TO_CHAR(LoginDate, 'yyyy-mm-dd') = '2024-06-22' ;

-- To zapytanie pobiera klientów, których karty będą przeterminowane za 7 dni.
SELECT c.CustomerID, c.FirstName, c.LastName, cd.CardNumber, cd.ExpirationDate
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
WHERE cd.ExpirationDate = SYSDATE + INTERVAL '7' DAY;

-- To zapytanie pobiera klientów, którzy wydali najwięcej w danym miesiącu.
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(t.Amount) AS TotalSpent
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
JOIN TransactionHistory t ON cd.CardID = t.CardID
WHERE TO_CHAR(t.TransactionDate, 'YYYY-MM') = TO_CHAR(SYSDATE, 'YYYY-MM')
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

-- Zapytanie 25: Klienci bez kart
-- Wysylac spam mailem zeby zalozyli
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
LEFT JOIN Cards cd ON c.CustomerID = cd.CustomerID
WHERE cd.CustomerID IS NULL;

!!!
-- Zapytanie 31: Klienci, którzy (NIE) wykonali transakcje w ciągu ostatniego miesiąca
-- TUTAJ trzeba wybrac tych na odwrot, ci ktorzy nie zrobili trazakcji placa kare z karte
SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
JOIN TransactionHistory t ON cd.CardID = t.CardID
WHERE t.TransactionDate > ADD_MONTHS(SYSDATE, -1);

-- Zapytanie 34: Oddziały i liczba przypisanych do nich kont
-- Skalujemy ilosc banokomatow i placowek ze wzgledu na polozenie
SELECT b.BranchName, COUNT(a.AccountID) AS NumberOfAccounts
FROM Branches b
JOIN Accounts a ON b.BranchID = a.BranchID
GROUP BY b.BranchName;

-- podstawowe ile mam na koncie

SELECT Balance FROM Accounts
WHERE AccountID = '1';


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



---  Wyświetlenie klientów, którzy mają dzisiaj urodziny
SELECT 
    CustomerID, 
    FirstName, 
    LastName, 
    BirthDate
FROM 
    Customers
WHERE 
    TO_CHAR(BirthDate, 'MM-DD') = TO_CHAR(SYSDATE, 'MM-DD');


-- MEnedzer oddziały 

SELECT b.BranchName, b.BranchAddress, e.FirstName, e.LastName, e.Email, e.Phone
FROM Branches b
JOIN Employees e ON b.BranchID = e.BranchID
JOIN Positions p ON e.PositionID = p.PositionID
WHERE p.PositionName = 'Menedżer';

