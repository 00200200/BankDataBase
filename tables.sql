-- (Klienci)
CREATE TABLE Customers (
    CustomerID NUMBER DEFAULT seq_customer_id.NEXTVAL PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    Phone VARCHAR2(15),
    BirthDate DATE NOT NULL,
    PESEL VARCHAR2(11) NOT NULL,
    IDNumber VARCHAR2(20) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M','F','O')),
    CreatedAt DATE DEFAULT SYSDATE
);

-- (Adresy)
CREATE TABLE Addresses (
    AddressID NUMBER DEFAULT seq_address_id.NEXTVAL PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    Street VARCHAR2(255),
    City VARCHAR2(100),
    State VARCHAR2(100),
    PostalCode VARCHAR2(20),
    Country VARCHAR2(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) -- jeden do wielu: Jeden klient może mieć wiele adresów
);

-- (Działy)
CREATE TABLE Departments (
    DepartmentID NUMBER DEFAULT seq_department_id.NEXTVAL PRIMARY KEY,
    DepartmentName VARCHAR2(100) NOT NULL
);

-- (Oddziały)
CREATE TABLE Branches (
    BranchID NUMBER DEFAULT seq_branch_id.NEXTVAL PRIMARY KEY,
    BranchName VARCHAR2(100) NOT NULL,
    BranchAddress VARCHAR2(255)
);

-- (Stanowiska)
CREATE TABLE Positions (
    PositionID NUMBER DEFAULT seq_position_id.NEXTVAL PRIMARY KEY,
    PositionName VARCHAR2(50) NOT NULL
);

-- (Pracownicy)
CREATE TABLE Employees (
    EmployeeID NUMBER DEFAULT seq_employee_id.NEXTVAL PRIMARY KEY,
    FirstName VARCHAR2(50) NOT NULL,
    LastName VARCHAR2(50) NOT NULL,
    Email VARCHAR2(100),
    Phone VARCHAR2(15),
    DepartmentID NUMBER NOT NULL,
    BranchID NUMBER NOT NULL,
    PositionID NUMBER NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID), -- jeden do wielu: Jeden dział może mieć wielu pracowników
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID), -- jeden do wielu: Jeden oddział może mieć wielu pracowników
    FOREIGN KEY (PositionID) REFERENCES Positions(PositionID) -- jeden do wielu: Jedna pozycja może być przypisana wielu pracownikom
);

-- (Typy kont)
CREATE TABLE AccountTypes (
    AccountTypeID NUMBER DEFAULT seq_account_type_id.NEXTVAL PRIMARY KEY,
    AccountTypeName VARCHAR2(50) NOT NULL
);

-- (Konta)
CREATE TABLE Accounts ( 
    AccountID NUMBER DEFAULT seq_account_id.NEXTVAL PRIMARY KEY,
    AccountNumber VARCHAR2(26) NOT NULL,
    AccountTypeID NUMBER NOT NULL,
    BranchID NUMBER NOT NULL,
    Balance NUMBER(15,2),
    CreatedAt DATE DEFAULT SYSDATE,
    FOREIGN KEY (AccountTypeID) REFERENCES AccountTypes(AccountTypeID), -- jeden do wielu: Jeden typ konta może być przypisany do wielu kont
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID) -- jeden do wielu: Jeden oddział może mieć wiele kont
);

-- (Karty)
CREATE TABLE Cards (
    CardID NUMBER DEFAULT seq_card_id.NEXTVAL PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    CardNumber VARCHAR2(16) NOT NULL,
    ExpirationDate DATE NOT NULL,
    CVV VARCHAR2(3) NOT NULL,
    CardType VARCHAR2(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) -- jeden do wielu: Jeden klient może mieć wiele kart
);

-- (Limity transakcji)
CREATE TABLE TransactionLimits (
    LimitID NUMBER DEFAULT seq_limit_id.NEXTVAL PRIMARY KEY,
    CardID NUMBER NOT NULL,
    TransactionLimitType VARCHAR2(20) CHECK (TransactionLimitType IN ('BLIK', 'Phone', 'Physical Card')),
    DailyLimit NUMBER(15, 2),
    MonthlyLimit NUMBER(15, 2),
    FOREIGN KEY (CardID) REFERENCES Cards(CardID) -- jeden do wielu: Jedna karta może mieć wiele limitów transakcji dla różnych typów płatności
);

-- (Historia transakcji)
CREATE TABLE TransactionHistory (
    TransactionID NUMBER DEFAULT seq_transaction_id.NEXTVAL PRIMARY KEY,
    CardID NUMBER NOT NULL,
    TransactionDate DATE DEFAULT SYSDATE,
    Amount NUMBER(15, 2),
    MerchantName VARCHAR2(100),
    FOREIGN KEY (CardID) REFERENCES Cards(CardID) -- jeden do wielu: Jedna karta może mieć wiele transakcji
);

-- (Historia logowania)
CREATE TABLE LoginHistory (
    LoginID NUMBER DEFAULT seq_login_id.NEXTVAL PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    LoginDate DATE DEFAULT SYSDATE,
    IPAddress VARCHAR2(45),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) -- jeden do wielu: Jeden klient może mieć wiele logowań
);

--(Relacja wiele do wielu między klientami a kontami)
CREATE TABLE CustomerAccounts (
    CustomerID NUMBER NOT NULL,
    AccountID NUMBER NOT NULL,
    PRIMARY KEY (CustomerID, AccountID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID), -- wiele do wielu: Jeden klient może mieć wiele kont, jedno konto może być przypisane do wielu klientów
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
