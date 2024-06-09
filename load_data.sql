-- Wstawianie danych do tabel

-- Departments
INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (seq_department_id.NEXTVAL, 'IT');

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (seq_department_id.NEXTVAL, 'HR');

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (seq_department_id.NEXTVAL, 'Sprzedaż');

INSERT INTO Departments (DepartmentID, DepartmentName)
VALUES (seq_department_id.NEXTVAL, 'Kredyty');

-- Branches
INSERT INTO Branches (BranchID, BranchName, BranchAddress)
VALUES (seq_branch_id.NEXTVAL, 'Oddział Warszawa', 'ul. Grunwaldzka 1, Warszawa');

INSERT INTO Branches (BranchID, BranchName, BranchAddress)
VALUES (seq_branch_id.NEXTVAL, 'Oddział Wrocław', 'ul. Curie-Skłodowskiej 13, Wrocław');

-- Positions
INSERT INTO Positions (PositionID, PositionName)
VALUES (seq_position_id.NEXTVAL, 'Menedżer');

INSERT INTO Positions (PositionID, PositionName)
VALUES (seq_position_id.NEXTVAL, 'Pracownik biurowy');

INSERT INTO Positions (PositionID, PositionName)
VALUES (seq_position_id.NEXTVAL, 'Specjalista IT');

INSERT INTO Positions (PositionID, PositionName)
VALUES (seq_position_id.NEXTVAL, 'Doradca kredytowy');

-- Customers
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, BirthDate, PESEL, IDNumber, Gender, CreatedAt)
VALUES (seq_customer_id.NEXTVAL, 'Jan', 'Kowalski', 'jan.kowalski@gmail.com', '123456789', TO_DATE('1980-01-01', 'YYYY-MM-DD'), '12345678901', 'DBC123456', 'M', SYSDATE);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, BirthDate, PESEL, IDNumber, Gender, CreatedAt)
VALUES (seq_customer_id.NEXTVAL, 'Anna', 'Kowalska', 'anna.kowalska@gmail.com', '987654321', TO_DATE('1990-02-02', 'YYYY-MM-DD'), '10987654321', 'DEF654321', 'F', SYSDATE);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, BirthDate, PESEL, IDNumber, Gender, CreatedAt)
VALUES (seq_customer_id.NEXTVAL, 'Wojtek', 'Suchecki', 'wojtek.suchecki@gmail.com', '123123123', TO_DATE('2002-03-03', 'YYYY-MM-DD'), '11112222333', 'DBC789012', 'M', SYSDATE);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, BirthDate, PESEL, IDNumber, Gender, CreatedAt)
VALUES (seq_customer_id.NEXTVAL, 'Michal', 'Furgala', 'michal.furgala@gmail.com', '321321321', TO_DATE('2002-04-04', 'YYYY-MM-DD'), '33322111100', 'DBC654987', 'M', SYSDATE);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, BirthDate, PESEL, IDNumber, Gender, CreatedAt)
VALUES (seq_customer_id.NEXTVAL, 'Robert', 'Lewandowski', 'Robert.Lewandowski@gmail.com', '123421342', TO_DATE('2002-04-04', 'YYYY-MM-DD'), '33322111100', 'DBC6511187', 'M', SYSDATE);
-- Addresses
INSERT INTO Addresses (AddressID, CustomerID, Street, City, State, PostalCode, Country)
VALUES (seq_address_id.NEXTVAL, 1, 'ul. Grunwaldzka 1', 'Warszawa', 'Mazowieckie', '00-001', 'Polska');

INSERT INTO Addresses (AddressID, CustomerID, Street, City, State, PostalCode, Country)
VALUES (seq_address_id.NEXTVAL, 2, 'ul. Grunwaldzka 1', 'Warszawa', 'Mazowieckie', '00-001', 'Polska');

INSERT INTO Addresses (AddressID, CustomerID, Street, City, State, PostalCode, Country)
VALUES (seq_address_id.NEXTVAL, 3, 'ul. Curie-Skłodowskiej 13', 'Wrocław', 'Dolnośląskie', '50-370', 'Polska');

INSERT INTO Addresses (AddressID, CustomerID, Street, City, State, PostalCode, Country)
VALUES (seq_address_id.NEXTVAL, 4, 'ul. Benedyktyńska 4', 'Wrocław', 'Dolnośląskie', '50-250', 'Polska');

-- Employees
INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Phone, DepartmentID, BranchID, PositionID)
VALUES (seq_employee_id.NEXTVAL, 'Adam', 'Nowicki', 'adam.nowicki@gmail.com', '555666777', 1, 1, 1);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Phone, DepartmentID, BranchID, PositionID)
VALUES (seq_employee_id.NEXTVAL, 'Ewa', 'Kwiatkowska', 'ewa.kwiatkowska@gmail.com', '555777888', 2, 1, 2);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Phone, DepartmentID, BranchID, PositionID)
VALUES (seq_employee_id.NEXTVAL, 'Wojtek', 'Suchecki', 'wojtek.suchecki@gmail.com', '555888999', 1, 2, 3);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Email, Phone, DepartmentID, BranchID, PositionID)
VALUES (seq_employee_id.NEXTVAL, 'Michal', 'Furgala', 'michal.furgala@gmail.com', '555999000', 4, 2, 4);

-- AccountTypes
INSERT INTO AccountTypes (AccountTypeID, AccountTypeName)
VALUES (seq_account_type_id.NEXTVAL, 'Oszczędnościowe');

INSERT INTO AccountTypes (AccountTypeID, AccountTypeName)
VALUES (seq_account_type_id.NEXTVAL, 'Osobiste');

INSERT INTO AccountTypes (AccountTypeID, AccountTypeName)
VALUES (seq_account_type_id.NEXTVAL, 'Kredytowe');

INSERT INTO AccountTypes (AccountTypeID, AccountTypeName)
VALUES (seq_account_type_id.NEXTVAL, 'Firmowe');

-- Accounts
INSERT INTO Accounts (AccountID, AccountNumber, AccountTypeID, BranchID, Balance, CreatedAt)
VALUES (seq_account_id.NEXTVAL, '12345678901234567890', 1, 1, 1000.00, SYSDATE);

INSERT INTO Accounts (AccountID, AccountNumber, AccountTypeID, BranchID, Balance, CreatedAt)
VALUES (seq_account_id.NEXTVAL, '09876543210987654321', 2, 1, 2000.00, SYSDATE);

INSERT INTO Accounts (AccountID, AccountNumber, AccountTypeID, BranchID, Balance, CreatedAt)
VALUES (seq_account_id.NEXTVAL, '11223344556677889900', 3, 2, 500.00, SYSDATE);

INSERT INTO Accounts (AccountID, AccountNumber, AccountTypeID, BranchID, Balance, CreatedAt)
VALUES (seq_account_id.NEXTVAL, '55443322110099887766', 1, 2, 1500.00, SYSDATE);

INSERT INTO Accounts (AccountID, AccountNumber, AccountTypeID, BranchID, Balance, CreatedAt)
VALUES (seq_account_id.NEXTVAL, '66778899001122334455', 2, 2, 3000.00, SYSDATE);

INSERT INTO Accounts (AccountID, AccountNumber, AccountTypeID, BranchID, Balance, CreatedAt)
VALUES (seq_account_id.NEXTVAL, '99887766554433221100', 3, 2, 4000.00, SYSDATE);

INSERT INTO Accounts (AccountID, AccountNumber, AccountTypeID, BranchID, Balance, CreatedAt)
VALUES (seq_account_id.NEXTVAL, '55667788990011223344', 1, 1, 5000.00, SYSDATE);

-- Cards
INSERT INTO Cards (CardID, CustomerID, CardNumber, ExpirationDate, CVV, CardType)
VALUES (seq_card_id.NEXTVAL, 1, '1111222233334444', TO_DATE('2025-12-31', 'YYYY-MM-DD'), '123', 'Visa');

INSERT INTO Cards (CardID, CustomerID, CardNumber, ExpirationDate, CVV, CardType)
VALUES (seq_card_id.NEXTVAL, 2, '4444333322221111', TO_DATE('2026-11-30', 'YYYY-MM-DD'), '456', 'MasterCard');

INSERT INTO Cards (CardID, CustomerID, CardNumber, ExpirationDate, CVV, CardType)
VALUES (seq_card_id.NEXTVAL, 3, '5555666677778888', TO_DATE('2024-05-31', 'YYYY-MM-DD'), '789', 'MasterCard');

INSERT INTO Cards (CardID, CustomerID, CardNumber, ExpirationDate, CVV, CardType)
VALUES (seq_card_id.NEXTVAL, 4, '8888777766665555', TO_DATE('2024-06-08', 'YYYY-MM-DD'), '321', 'Visa');

-- TransactionLimits
INSERT INTO TransactionLimits (LimitID, CardID, TransactionLimitType, DailyLimit, MonthlyLimit)
VALUES (seq_limit_id.NEXTVAL, 1, 'BLIK', 500.00, 10000.00);

INSERT INTO TransactionLimits (LimitID, CardID, TransactionLimitType, DailyLimit, MonthlyLimit)
VALUES (seq_limit_id.NEXTVAL, 1, 'Phone', 300.00, 8000.00);

INSERT INTO TransactionLimits (LimitID, CardID, TransactionLimitType, DailyLimit, MonthlyLimit)
VALUES (seq_limit_id.NEXTVAL, 1, 'Physical Card', 700.00, 12000.00);

INSERT INTO TransactionLimits (LimitID, CardID, TransactionLimitType, DailyLimit, MonthlyLimit)
VALUES (seq_limit_id.NEXTVAL, 2, 'BLIK', 500.00, 10000.00);

INSERT INTO TransactionLimits (LimitID, CardID, TransactionLimitType, DailyLimit, MonthlyLimit)
VALUES (seq_limit_id.NEXTVAL, 2, 'Phone', 300.00, 8000.00);

INSERT INTO TransactionLimits (LimitID, CardID, TransactionLimitType, DailyLimit, MonthlyLimit)
VALUES (seq_limit_id.NEXTVAL, 2, 'Physical Card', 700.00, 12000.00);

-- TransactionHistory
INSERT INTO TransactionHistory (TransactionID, CardID, TransactionDate, Amount, MerchantName)
VALUES (seq_transaction_id.NEXTVAL, 1, SYSDATE - INTERVAL '30' DAY, 50.00, 'Biedronka');

INSERT INTO TransactionHistory (TransactionID, CardID, TransactionDate, Amount, MerchantName)
VALUES (seq_transaction_id.NEXTVAL, 2, SYSDATE - INTERVAL '20' DAY, 30.00, 'Kaufland');

INSERT INTO TransactionHistory (TransactionID, CardID, TransactionDate, Amount, MerchantName)
VALUES (seq_transaction_id.NEXTVAL, 3, SYSDATE - INTERVAL '10' DAY, 6.00, 'Trumienka');

INSERT INTO TransactionHistory (TransactionID, CardID, TransactionDate, Amount, MerchantName)
VALUES (seq_transaction_id.NEXTVAL, 4, SYSDATE - INTERVAL '5' DAY, 100.00, 'Żabka');

INSERT INTO TransactionHistory (TransactionID, CardID, TransactionDate, Amount, MerchantName)
VALUES (seq_transaction_id.NEXTVAL, 4, SYSDATE - INTERVAL '2' DAY, 11000.00, 'ISpot');

INSERT INTO TransactionHistory (TransactionID, CardID, TransactionDate, Amount, MerchantName)
VALUES (seq_transaction_id.NEXTVAL, 1, SYSDATE - INTERVAL '2' DAY, 2000.00, 'Sklep A');

INSERT INTO TransactionHistory (TransactionID, CardID, TransactionDate, Amount, MerchantName)
VALUES (seq_transaction_id.NEXTVAL, 2, SYSDATE - INTERVAL '3' DAY, 3000.00, 'Sklep B');

INSERT INTO TransactionHistory (TransactionID, CardID, TransactionDate, Amount, MerchantName)
VALUES (seq_transaction_id.NEXTVAL, 3, SYSDATE - INTERVAL '1' DAY, 4000.00, 'Sklep C');

INSERT INTO TransactionHistory (TransactionID, CardID, TransactionDate, Amount, MerchantName)
VALUES (seq_transaction_id.NEXTVAL, 4, SYSDATE - INTERVAL '4' DAY, 5000.00, 'Sklep D');

INSERT INTO TransactionHistory (TransactionID, CardID, TransactionDate, Amount, MerchantName)
VALUES (seq_transaction_id.NEXTVAL, 1, SYSDATE - INTERVAL '5' DAY, 1500.00, 'Media Markt');

INSERT INTO TransactionHistory (TransactionID, CardID, TransactionDate, Amount, MerchantName)
VALUES (seq_transaction_id.NEXTVAL, 2, SYSDATE - INTERVAL '10' DAY, 2500.00, 'Media Expert');

INSERT INTO TransactionHistory (TransactionID, CardID, TransactionDate, Amount, MerchantName)
VALUES (seq_transaction_id.NEXTVAL, 3, SYSDATE - INTERVAL '15' DAY, 3500.00, 'Komputronik');


-- LoginHistory
INSERT INTO LoginHistory (LoginID, CustomerID, LoginDate, IPAddress)
VALUES (seq_login_id.NEXTVAL, 1, SYSDATE - INTERVAL '1' DAY, '192.168.1.1');

INSERT INTO LoginHistory (LoginID, CustomerID, LoginDate, IPAddress)
VALUES (seq_login_id.NEXTVAL, 2, SYSDATE - INTERVAL '2' DAY, '192.168.1.2');

INSERT INTO LoginHistory (LoginID, CustomerID, LoginDate, IPAddress)
VALUES (seq_login_id.NEXTVAL, 3, SYSDATE - INTERVAL '3' DAY, '192.168.1.3');

INSERT INTO LoginHistory (LoginID, CustomerID, LoginDate, IPAddress)
VALUES (seq_login_id.NEXTVAL, 4, SYSDATE - INTERVAL '4' DAY, '192.168.1.4');

-- CustomerAccounts -- WIELE DO WIELU Kowalscy mają wspólne konto, Furgala posiada 3 konta.
INSERT INTO CustomerAccounts (CustomerID, AccountID)
VALUES (1, 1); 

INSERT INTO CustomerAccounts (CustomerID, AccountID)
VALUES (2, 1); 

INSERT INTO CustomerAccounts (CustomerID, AccountID)
VALUES (1, 5); 

INSERT INTO CustomerAccounts (CustomerID, AccountID)
VALUES (2, 5); 

INSERT INTO CustomerAccounts (CustomerID, AccountID)
VALUES (3, 3); 

INSERT INTO CustomerAccounts (CustomerID, AccountID)
VALUES (4, 4); 

INSERT INTO CustomerAccounts (CustomerID, AccountID)
VALUES (4, 6); 

INSERT INTO CustomerAccounts (CustomerID, AccountID)
VALUES (4, 7);




-- Konto z ujemnym saldem 

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, BirthDate, PESEL, IDNumber, Gender, CreatedAt)
VALUES (seq_customer_id.NEXTVAL, 'Piotr', 'Nowak', 'piotr.nowak@gmail.com', '987654321', TO_DATE('1985-05-05', 'YYYY-MM-DD'), '55667788900', 'ID1234567', 'M', SYSDATE);


INSERT INTO Addresses (AddressID, CustomerID, Street, City, State, PostalCode, Country)
VALUES (seq_address_id.NEXTVAL, seq_customer_id.CURRVAL, 'ul. Jana Pawła II 2', 'Kraków', 'Małopolskie', '31-158', 'Polska');


INSERT INTO Accounts (AccountID, AccountNumber, AccountTypeID, BranchID, Balance, CreatedAt)
VALUES (seq_account_id.NEXTVAL, '3333444455556666', 1, 1, -200.00, SYSDATE);


INSERT INTO CustomerAccounts (CustomerID, AccountID)
VALUES (seq_customer_id.CURRVAL, seq_account_id.CURRVAL);

