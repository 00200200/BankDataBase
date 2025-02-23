-- Wyświetlenie wszystkich informacji o kliencie na podstawie numeru PESEL
SELECT * FROM vw_customer_info
WHERE PESEL = '12345678901';

-- Pobranie wszystkich transakcji wykonanych przez kartę na podstawie jej ID
SELECT * FROM vw_card_transactions
WHERE CardID = 1;

-- Historia logowania dla określonego klienta
SELECT * FROM vw_login_history 
WHERE CustomerID = 1;

-- Pobranie wszystkich transakcji przekraczających określoną kwotę
-- (Do monitorowania podejrzanych/duzych transakcji)
SELECT * FROM vw_card_transactions 
WHERE Amount > 10000.00;

-- Transakcje wykonane w danym miesiącu dla konkretnej karty
SELECT * FROM vw_card_transactions 
WHERE TO_CHAR(TransactionDate, 'YYYY-MM') = '2024-05' AND CardID = 1;

-- Łączna liczba logowań klientów dla określonej daty
-- (do badan w ktore dni jest najwieksze obciazenie serwerow,
-- oraz ewentulane ich okresowe powiekszenie) 
SELECT COUNT(*) AS TotalLogins 
FROM LoginHistory 
WHERE TO_CHAR(LoginDate, 'yyyy-mm-dd') = '2024-06-06';

-- Klienci, których karty będą przeterminowane za 7 dni Lub ktora sa przeterminowane
SELECT c.CustomerID, c.FirstName, c.LastName, cd.CardNumber, cd.ExpirationDate
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
WHERE cd.ExpirationDate < SYSDATE + INTERVAL '7' DAY;

-- 10 Klientow , którzy wydali najwięcej w danym roku
-- (Potnecjalni kandydaci na otrzymanie zlotej karty naszego banku)
SELECT * FROM (
    SELECT c.CustomerID, c.FirstName, c.LastName, SUM(t.Amount) AS TotalSpent
    FROM Customers c
    JOIN Cards cd ON c.CustomerID = cd.CustomerID
    JOIN TransactionHistory t ON cd.CardID = t.CardID
    WHERE TO_CHAR(t.TransactionDate, 'YYYY-MM') = TO_CHAR(SYSDATE, 'YYYY-MM')
    GROUP BY c.CustomerID, c.FirstName, c.LastName
    ORDER BY TotalSpent DESC
) WHERE ROWNUM <= 10;

-- Klienci bez kart
-- (Aby wysylac im reklami/spam o zalozenie ich)
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
LEFT JOIN Cards cd ON c.CustomerID = cd.CustomerID
WHERE cd.CustomerID IS NULL;

-- Klienci, którzy nie wykonali żadnych transakcji w ciągu ostatniego miesiąca
-- (Klienci ktorzy powinni zostac oblzeni oplata za posiadanie karty, nie uzywajac jej)
SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
LEFT JOIN TransactionHistory t ON cd.CardID = t.CardID
WHERE t.TransactionDate IS NULL OR t.TransactionDate < ADD_MONTHS(SYSDATE, -1);

-- Oddziały i liczba przypisanych do nich kont
-- (Dostarczyc odpowiednia ilosc bankomatow/placowek na dany obszar)
SELECT b.BranchName, COUNT(a.AccountID) AS NumberOfAccounts
FROM Branches b
JOIN Accounts a ON b.BranchID = a.BranchID
GROUP BY b.BranchName;

-- Wyświetlenie salda konkretnego konta
SELECT Balance FROM Accounts
WHERE AccountID = 1;

-- Wyświetlenie transakcji wykonanych przez konkretnego klienta
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
    
-- Wyświetlenie klientów, którzy mają saldo ujemne
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

-- Wyświetlenie klientów, którzy mają dzisiaj urodziny
-- (Aby wysylac im zyczenia :) )
SELECT 
    CustomerID, 
    FirstName, 
    LastName, 
    BirthDate
FROM 
    Customers
WHERE 
    TO_CHAR(BirthDate, 'MM-DD') = TO_CHAR(SYSDATE, 'MM-DD');

-- Wyświetlenie oddziałów i ich menedżerów
SELECT b.BranchName, b.BranchAddress, e.FirstName, e.LastName, e.Email, e.Phone
FROM Branches b
JOIN Employees e ON b.BranchID = e.BranchID
JOIN Positions p ON e.PositionID = p.PositionID
WHERE p.PositionName = 'Menedżer';
