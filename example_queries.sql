-- Zapytanie 1: Pobranie wszystkich informacji o klientach
-- To zapytanie pobiera wszystkie szczegóły klientów razem z ich adresami.
SELECT * FROM vw_customer_info;

-- Zapytanie 2: Pobranie wszystkich transakcji kartowych
-- To zapytanie pobiera wszystkie transakcje wykonane przy użyciu kart, pokazując szczegóły kart i transakcji.
SELECT * FROM vw_card_transactions;

-- Zapytanie 3: Historia logowania dla określonego klienta
-- To zapytanie pobiera historię logowania klienta na podstawie jego ID.
SELECT * FROM vw_login_history WHERE CustomerID = 1;

-- Zapytanie 4: Pracownicy według działu
-- To zapytanie grupuje pracowników według ich działu i liczy liczbę pracowników w każdym dziale.
SELECT DepartmentName, COUNT(EmployeeID) AS NumberOfEmployees
FROM vw_employee_info
GROUP BY DepartmentName;

-- Zapytanie 5: Łączna wartość salda kont w oddziałach
-- To zapytanie sumuje saldo wszystkich kont pogrupowanych według oddziału, do którego należą.
SELECT b.BranchName, SUM(a.Balance) AS TotalBalance
FROM Accounts a
JOIN Branches b ON a.BranchID = b.BranchID
GROUP BY b.BranchName;

-- Zapytanie 6: Średnia kwota transakcji według typu karty
-- To zapytanie oblicza średnią kwotę transakcji dla każdego typu karty.
SELECT c.CardType, AVG(t.Amount) AS AverageTransactionAmount
FROM Cards c
JOIN TransactionHistory t ON c.CardID = t.CardID
GROUP BY c.CardType;

-- Zapytanie 7: Liczba klientów posiadających więcej niż jedno konto
-- To zapytanie pobiera liczbę klientów, którzy posiadają więcej niż jedno konto.
SELECT CustomerID, COUNT(AccountID) AS NumberOfAccounts
FROM CustomerAccounts
GROUP BY CustomerID
HAVING COUNT(AccountID) > 1;

-- Zapytanie 8: Szczegóły pracowników w określonym oddziale
-- To zapytanie pobiera wszystkie szczegóły pracowników pracujących w określonym oddziale na podstawie nazwy oddziału.
SELECT * FROM vw_employee_info WHERE BranchName = 'Oddział Warszawa';

-- Zapytanie 9: Transakcje przekraczające określoną kwotę
-- To zapytanie pobiera wszystkie transakcje, które przekraczają określoną kwotę.
SELECT * FROM vw_card_transactions WHERE Amount > 100.00;

-- Zapytanie 10: Łączna wartość transakcji dokonanych przez klientów z określonego miasta
-- To zapytanie sumuje wartość transakcji dokonanych przez klientów z określonego miasta.
SELECT ci.City, SUM(th.Amount) AS TotalTransactionAmount
FROM vw_customer_info ci
JOIN Cards c ON ci.CustomerID = c.CustomerID
JOIN TransactionHistory th ON c.CardID = th.CardID
WHERE ci.City = 'Warszawa'
GROUP BY ci.City;

-- Zapytanie 11: Klienci i liczba ich kart
-- To zapytanie pobiera klientów i liczy liczbę kart przypisanych do każdego z nich.
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(cd.CardID) AS NumberOfCards
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- Zapytanie 12: Pracownicy według oddziału i działu
-- To zapytanie grupuje pracowników według ich oddziału i działu oraz liczy liczbę pracowników w każdej grupie.
SELECT b.BranchName, d.DepartmentName, COUNT(e.EmployeeID) AS NumberOfEmployees
FROM vw_employee_info e
GROUP BY b.BranchName, d.DepartmentName;

-- Zapytanie 13: Średnie saldo kont według typu konta
-- To zapytanie oblicza średnie saldo kont dla każdego typu konta.
SELECT at.AccountTypeName, AVG(a.Balance) AS AverageBalance
FROM Accounts a
JOIN AccountTypes at ON a.AccountTypeID = at.AccountTypeID
GROUP BY at.AccountTypeName;

-- Zapytanie 14: Transakcje wykonane w danym miesiącu
-- To zapytanie pobiera wszystkie transakcje wykonane w określonym miesiącu.
SELECT * FROM vw_card_transactions WHERE TO_CHAR(TransactionDate, 'YYYY-MM') = '2023-05';

-- Zapytanie 15: Klienci i ich konta
-- To zapytanie pobiera klientów razem z numerami ich kont.
SELECT c.CustomerID, c.FirstName, c.LastName, a.AccountNumber
FROM Customers c
JOIN CustomerAccounts ca ON c.CustomerID = ca.CustomerID
JOIN Accounts a ON ca.AccountID = a.AccountID;

-- Zapytanie 16: Łączna liczba logowań klientów
-- To zapytanie liczy łączną liczbę logowań klientów.
SELECT COUNT(*) AS TotalLogins FROM LoginHistory;

-- Zapytanie 17: Pracownicy z określonego działu
-- To zapytanie pobiera pracowników należących do określonego działu.
SELECT * FROM vw_employee_info WHERE DepartmentName = 'IT';

-- Zapytanie 18: Klienci z przeterminowanymi kartami
-- To zapytanie pobiera klientów, których karty są przeterminowane.
SELECT c.CustomerID, c.FirstName, c.LastName, cd.CardNumber, cd.ExpirationDate
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
WHERE cd.ExpirationDate < SYSDATE;

-- Zapytanie 19: Transakcje w danym przedziale czasowym
-- To zapytanie pobiera wszystkie transakcje wykonane w określonym przedziale czasowym.
SELECT * FROM vw_card_transactions WHERE TransactionDate BETWEEN TO_DATE('2023-01-01', 'YYYY-MM-DD') AND TO_DATE('2023-12-31', 'YYYY-MM-DD');

-- Zapytanie 20: Klienci posiadający konta w określonym oddziale
-- To zapytanie pobiera klientów, którzy posiadają konta w określonym oddziale.
SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
JOIN CustomerAccounts ca ON c.CustomerID = ca.CustomerID
JOIN Accounts a ON ca.AccountID = a.AccountID
WHERE a.BranchID = (SELECT BranchID FROM Branches WHERE BranchName = 'Oddział Wrocław');


-- Zapytanie 21: Lista klientów z ich ostatnim logowaniem
-- To zapytanie pobiera klientów wraz z datą ich ostatniego logowania.
SELECT lh.CustomerID, c.FirstName, c.LastName, MAX(lh.LoginDate) AS LastLoginDate
FROM LoginHistory lh
JOIN Customers c ON lh.CustomerID = c.CustomerID
GROUP BY lh.CustomerID, c.FirstName, c.LastName;

-- Zapytanie 22: Łączna wartość transakcji dla każdej karty
-- To zapytanie sumuje wartość transakcji dla każdej karty.
SELECT c.CardNumber, SUM(t.Amount) AS TotalTransactionAmount
FROM Cards c
JOIN TransactionHistory t ON c.CardID = t.CardID
GROUP BY c.CardNumber;

-- Zapytanie 23: Lista klientów z najwięcej transakcjami
-- To zapytanie pobiera klientów, którzy wykonali najwięcej transakcji.
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(t.TransactionID) AS NumberOfTransactions
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
JOIN TransactionHistory t ON cd.CardID = t.CardID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY NumberOfTransactions DESC;

-- Zapytanie 24: Pracownicy i ich zarobki
-- To zapytanie pobiera pracowników i ich zarobki (przy założeniu, że taka kolumna istnieje).
SELECT e.EmployeeID, e.FirstName, e.LastName, e.Salary
FROM Employees e;

-- Zapytanie 25: Klienci bez kart
-- To zapytanie pobiera klientów, którzy nie mają przypisanych kart.
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
LEFT JOIN Cards cd ON c.CustomerID = cd.CustomerID
WHERE cd.CustomerID IS NULL;

-- Zapytanie 26: Pracownicy zatrudnieni po określonej dacie
-- To zapytanie pobiera pracowników zatrudnionych po określonej dacie.
SELECT e.EmployeeID, e.FirstName, e.LastName, e.HireDate
FROM Employees e
WHERE e.HireDate > TO_DATE('2022-01-01', 'YYYY-MM-DD');

-- Zapytanie 27: Klienci z określonym typem konta
-- To zapytanie pobiera klientów, którzy posiadają konto określonego typu.
SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
JOIN CustomerAccounts ca ON c.CustomerID = ca.CustomerID
JOIN Accounts a ON ca.AccountID = a.AccountID
WHERE a.AccountTypeID = (SELECT AccountTypeID FROM AccountTypes WHERE AccountTypeName = 'Osobiste');

-- Zapytanie 28: Średnie saldo kont dla każdego klienta
-- To zapytanie oblicza średnie saldo kont dla każdego klienta.
SELECT c.CustomerID, c.FirstName, c.LastName, AVG(a.Balance) AS AverageBalance
FROM Customers c
JOIN CustomerAccounts ca ON c.CustomerID = ca.CustomerID
JOIN Accounts a ON ca.AccountID = a.AccountID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- Zapytanie 29: Klienci z najniższym saldem na koncie
-- To zapytanie pobiera klientów, którzy mają najniższe saldo na koncie.
SELECT c.CustomerID, c.FirstName, c.LastName, MIN(a.Balance) AS LowestBalance
FROM Customers c
JOIN CustomerAccounts ca ON c.CustomerID = ca.CustomerID
JOIN Accounts a ON ca.AccountID = a.AccountID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY LowestBalance ASC;

-- Zapytanie 30: Pracownicy z najdłuższym stażem pracy
-- To zapytanie pobiera pracowników z najdłuższym stażem pracy.
SELECT e.EmployeeID, e.FirstName, e.LastName, e.HireDate
FROM Employees e
ORDER BY e.HireDate ASC;

-- Zapytanie 31: Klienci, którzy wykonali transakcje w ciągu ostatniego miesiąca
-- To zapytanie pobiera klientów, którzy wykonali transakcje w ciągu ostatniego miesiąca.
SELECT DISTINCT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
JOIN TransactionHistory t ON cd.CardID = t.CardID
WHERE t.TransactionDate > ADD_MONTHS(SYSDATE, -1);

-- Zapytanie 32: Najpopularniejszy typ konta
-- To zapytanie oblicza najpopularniejszy typ konta wśród klientów.
SELECT at.AccountTypeName, COUNT(a.AccountID) AS NumberOfAccounts
FROM AccountTypes at
JOIN Accounts a ON at.AccountTypeID = a.AccountTypeID
GROUP BY at.AccountTypeName
ORDER BY NumberOfAccounts DESC;

-- Zapytanie 33: Klienci i ich łączne limity transakcji dziennych
-- To zapytanie pobiera klientów oraz sumuje ich dzienne limity transakcji dla wszystkich kart.
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(tl.DailyLimit) AS TotalDailyLimit
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
JOIN TransactionLimits tl ON cd.CardID = tl.CardID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- Zapytanie 34: Oddziały i liczba przypisanych do nich kont
-- To zapytanie grupuje oddziały według liczby przypisanych do nich kont.
SELECT b.BranchName, COUNT(a.AccountID) AS NumberOfAccounts
FROM Branches b
JOIN Accounts a ON b.BranchID = a.BranchID
GROUP BY b.BranchName;

-- Zapytanie 35: Klienci, którzy nigdy się nie logowali
-- To zapytanie pobiera klientów, którzy nigdy nie zalogowali się na swoje konto.
SELECT c.CustomerID, c.FirstName, c.LastName
FROM Customers c
LEFT JOIN LoginHistory lh ON c.CustomerID = lh.CustomerID
WHERE lh.CustomerID IS NULL;

-- Zapytanie 36: Klienci z wieloma adresami
-- To zapytanie pobiera klientów, którzy mają więcej niż jeden adres.
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(a.AddressID) AS NumberOfAddresses
FROM Customers c
JOIN Addresses a ON c.CustomerID = a.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(a.AddressID) > 1;

-- Zapytanie 37: Transakcje według miesiąca
-- To zapytanie grupuje transakcje według miesiąca i liczy ich liczbę.
SELECT TO_CHAR(t.TransactionDate, 'YYYY-MM') AS Month, COUNT(t.TransactionID) AS NumberOfTransactions
FROM TransactionHistory t
GROUP BY TO_CHAR(t.TransactionDate, 'YYYY-MM')
ORDER BY Month;

-- Zapytanie 38: Klienci z największą liczbą kart
-- To zapytanie pobiera klientów z największą liczbą kart.
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(cd.CardID) AS NumberOfCards
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY NumberOfCards DESC;

-- Zapytanie 39: Pracownicy przypisani do więcej niż jednego działu
-- To zapytanie pobiera pracowników przypisanych do więcej niż jednego działu.
SELECT e.EmployeeID, e.FirstName, e.LastName, COUNT(d.DepartmentID) AS NumberOfDepartments
FROM Employees e
JOIN Departments d ON e.DepartmentID = d.DepartmentID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(d.DepartmentID) > 1;

-- Zapytanie 40: Łączna wartość transakcji według typu karty
-- To zapytanie sumuje wartość transakcji dla każdego typu karty.
SELECT c.CardType, SUM(t.Amount) AS TotalTransactionAmount
FROM Cards c
JOIN TransactionHistory t ON c.CardID = t.CardID
GROUP BY c.CardType;

-- Zapytanie 41: Klienci z kontami w wielu oddziałach
-- To zapytanie pobiera klientów, którzy posiadają konta w więcej niż jednym oddziale.
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(DISTINCT a.BranchID) AS NumberOfBranches
FROM Customers c
JOIN CustomerAccounts ca ON c.CustomerID = ca.CustomerID
JOIN Accounts a ON ca.AccountID = a.AccountID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(DISTINCT a.BranchID) > 1;

-- Zapytanie 42: Najczęściej logujący się klienci
-- To zapytanie pobiera klientów, którzy najczęściej logują się na swoje konto.
SELECT lh.CustomerID, c.FirstName, c.LastName, COUNT(lh.LoginID) AS NumberOfLogins
FROM LoginHistory lh
JOIN Customers c ON lh.CustomerID = c.CustomerID
GROUP BY lh.CustomerID, c.FirstName, c.LastName
ORDER BY NumberOfLogins DESC;

-- Zapytanie 43: Średnie saldo kont według miasta
-- To zapytanie oblicza średnie saldo kont dla każdego miasta.
SELECT a.City, AVG(ac.Balance) AS AverageBalance
FROM Addresses a
JOIN Customers c ON a.CustomerID = c.CustomerID
JOIN CustomerAccounts ca ON c.CustomerID = ca.CustomerID
JOIN Accounts ac ON ca.AccountID = ac.AccountID
GROUP BY a.City;

-- Zapytanie 44: Liczba pracowników na stanowisku
-- To zapytanie liczy liczbę pracowników na każdym stanowisku.
SELECT p.PositionName, COUNT(e.EmployeeID) AS NumberOfEmployees
FROM Positions p
JOIN Employees e ON p.PositionID = e.PositionID
GROUP BY p.PositionName;

-- Zapytanie 45: Transakcje wykonane przez klientów z danego kraju
-- To zapytanie pobiera wszystkie transakcje wykonane przez klientów z określonego kraju.
SELECT ci.Country, t.TransactionID, t.TransactionDate, t.Amount, t.MerchantName
FROM vw_customer_info ci
JOIN Cards cd ON ci.CustomerID = cd.CustomerID
JOIN TransactionHistory t ON cd.CardID = t.CardID
WHERE ci.Country = 'Polska';

-- Zapytanie 46: Średnia kwota transakcji dla każdego klienta
-- To zapytanie oblicza średnią kwotę transakcji dla każdego klienta.
SELECT c.CustomerID, c.FirstName, c.LastName, AVG(t.Amount) AS AverageTransactionAmount
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
JOIN TransactionHistory t ON cd.CardID = t.CardID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- Zapytanie 47: Najczęściej używane typy kart
-- To zapytanie pobiera najczęściej używane typy kart w transakcjach.
SELECT c.CardType, COUNT(t.TransactionID) AS NumberOfTransactions
FROM Cards c
JOIN TransactionHistory t ON c.CardID = t.CardID
GROUP BY c.CardType
ORDER BY NumberOfTransactions DESC;

-- Zapytanie 48: Klienci z największymi limitami transakcji
-- To zapytanie pobiera klientów z największymi limitami transakcji dziennych.
SELECT c.CustomerID, c.FirstName, c.LastName, MAX(tl.DailyLimit) AS MaxDailyLimit
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
JOIN TransactionLimits tl ON cd.CardID = tl.CardID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY MaxDailyLimit DESC;

-- Zapytanie 49: Transakcje wykonane w danym roku
-- To zapytanie pobiera wszystkie transakcje wykonane w określonym roku.
SELECT * FROM vw_card_transactions WHERE TO_CHAR(TransactionDate, 'YYYY') = '2023';

-- Zapytanie 50: Łączna liczba kont dla każdego klienta
-- To zapytanie liczy łączną liczbę kont posiadanych przez każdego klienta.
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(ca.AccountID) AS NumberOfAccounts
FROM Customers c
JOIN CustomerAccounts ca ON c.CustomerID = ca.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName;

-- Zapytanie 51: Klienci z najstarszymi kontami
-- To zapytanie pobiera klientów z najstarszymi datami utworzenia kont.
SELECT c.CustomerID, c.FirstName, c.LastName, MIN(a.CreatedAt) AS OldestAccountDate
FROM Customers c
JOIN CustomerAccounts ca ON c.CustomerID = ca.CustomerID
JOIN Accounts a ON ca.AccountID = a.AccountID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY OldestAccountDate ASC;

-- Zapytanie 52: Klienci z dużą liczbą adresów
-- To zapytanie pobiera klientów, którzy mają więcej niż trzy adresy.
SELECT c.CustomerID, c.FirstName, c.LastName, COUNT(a.AddressID) AS NumberOfAddresses
FROM Customers c
JOIN Addresses a ON c.CustomerID = a.CustomerID
GROUP BY c.CustomerID, c.FirstName, c.LastName
HAVING COUNT(a.AddressID) > 3;

-- Zapytanie 53: Pracownicy z określoną liczbą logowań
-- To zapytanie pobiera pracowników, którzy zalogowali się więcej niż określoną liczbę razy.
SELECT e.EmployeeID, e.FirstName, e.LastName, COUNT(lh.LoginID) AS NumberOfLogins
FROM Employees e
JOIN LoginHistory lh ON e.EmployeeID = lh.CustomerID
GROUP BY e.EmployeeID, e.FirstName, e.LastName
HAVING COUNT(lh.LoginID) > 10;

-- Zapytanie 54: Średnie saldo kont dla każdego oddziału
-- To zapytanie oblicza średnie saldo kont dla każdego oddziału.
SELECT b.BranchName, AVG(a.Balance) AS AverageBalance
FROM Branches b
JOIN Accounts a ON b.BranchID = a.BranchID
GROUP BY b.BranchName;

-- Zapytanie 55: Klienci z największymi wydatkami
-- To zapytanie pobiera klientów, którzy wydali najwięcej w swoich transakcjach.
SELECT c.CustomerID, c.FirstName, c.LastName, SUM(t.Amount) AS TotalSpent
FROM Customers c
JOIN Cards cd ON c.CustomerID = cd.CustomerID
JOIN TransactionHistory t ON cd.CardID = t.CardID
GROUP BY c.CustomerID, c.FirstName, c.LastName
ORDER BY TotalSpent DESC;

-- Zapytanie 56: Pracownicy i ich przełożeni
-- To zapytanie pobiera pracowników i ich przełożonych (przy założeniu, że takie kolumny istnieją).
SELECT e.EmployeeID, e.FirstName, e.LastName, e.ManagerID, m.FirstName AS ManagerFirstName, m.LastName AS ManagerLastName
FROM Employees e
LEFT JOIN Employees m ON e.ManagerID = m.EmployeeID;

-- Zapytanie 57: Transakcje wykonane przez klientów z określonego stanu
-- To zapytanie pobiera wszystkie transakcje wykonane przez klientów z określonego stanu.
SELECT ci.State, t.TransactionID, t.TransactionDate, t.Amount, t.MerchantName
FROM vw_customer_info ci
JOIN Cards cd ON ci.CustomerID = cd.CustomerID
JOIN TransactionHistory t ON cd.CardID = t.CardID
WHERE ci.State = 'Mazowieckie';

-- Zapytanie 58: Średnia kwota transakcji według miesiąca
-- To zapytanie oblicza średnią kwotę transakcji dla każdego miesiąca.
SELECT TO_CHAR(t.TransactionDate, 'YYYY-MM') AS Month, AVG(t.Amount) AS AverageTransactionAmount
FROM TransactionHistory t
GROUP BY TO_CHAR(t.TransactionDate, 'YYYY-MM')
ORDER BY Month;

-- Zapytanie 59: Pracownicy zatrudnieni w ostatnich 6 miesiącach
-- To zapytanie pobiera pracowników zatrudnionych w ciągu ostatnich 6 miesięcy.
SELECT e.EmployeeID, e.FirstName, e.LastName, e.HireDate
FROM Employees e
WHERE e.HireDate > ADD_MONTHS(SYSDATE, -6);

-- Zapytanie 60: Łączna wartość transakcji według sprzedawcy
-- To zapytanie sumuje wartość transakcji dla każdego sprzedawcy.
SELECT t.MerchantName, SUM(t.Amount) AS TotalTransactionAmount
FROM TransactionHistory t
GROUP BY t.MerchantName
ORDER BY TotalTransactionAmount DESC;
