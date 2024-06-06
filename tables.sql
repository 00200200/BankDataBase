-- Customers (Klienci)
CREATE TABLE Customers (
    CustomerID NUMBER PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    BirthDate DATE NOT NULL,
    PESEL VARCHAR(11) NOT NULL,
    IDNumber VARCHAR(20) NOT NULL,
    Gender CHAR(1) CHECK (Gender IN ('M','F','O')),
    CreatedAt DATE DEFAULT SYSDATE
);
-- DODADC DATE URODZENA XDD 

-- Addresses (Adresy)
CREATE TABLE Addresses (
    AddressID NUMBER PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    Street VARCHAR(255),
    City VARCHAR(100),
    State VARCHAR(100),
    PostalCode VARCHAR(20),
    Country VARCHAR(100),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) -- Relacja jeden do wielu: Jeden klient może mieć wiele adresów
);

-- Departments (Działy)
CREATE TABLE Departments (
    DepartmentID NUMBER PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL
);

-- Branches (Oddziały)
CREATE TABLE Branches (
    BranchID NUMBER PRIMARY KEY,
    BranchName VARCHAR(100) NOT NULL,
    BranchAddress VARCHAR(255)
);

-- Positions (Stanowiska)
CREATE TABLE Positions (
    PositionID NUMBER PRIMARY KEY,
    PositionName VARCHAR(50) NOT NULL
);

-- Employees (Pracownicy)
CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    Phone VARCHAR(15),
    DepartmentID NUMBER NOT NULL,
    BranchID NUMBER NOT NULL,
    PositionID NUMBER NOT NULL,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID), -- Relacja jeden do wielu: Jeden dział może mieć wielu pracowników
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID), -- Relacja jeden do wielu: Jeden oddział może mieć wielu pracowników
    FOREIGN KEY (PositionID) REFERENCES Positions(PositionID) -- Relacja jeden do wielu: Jedna pozycja może być przypisana wielu pracownikom
);

-- AccountTypes (Typy kont)
CREATE TABLE AccountTypes (
    AccountTypeID NUMBER PRIMARY KEY,
    AccountTypeName VARCHAR(50) NOT NULL
);

-- Accounts (Konta)
CREATE TABLE Accounts ( 
    AccountID NUMBER PRIMARY KEY,
    AccountNumber VARCHAR(26) NOT NULL,
    AccountTypeID NUMBER NOT NULL,
    BranchID NUMBER NOT NULL,
    Balance NUMBER(15,2),
    CreatedAt DATE DEFAULT SYSDATE,
    FOREIGN KEY (AccountTypeID) REFERENCES AccountTypes(AccountTypeID), -- Relacja jeden do wielu: Jeden typ konta może być przypisany do wielu kont
    FOREIGN KEY (BranchID) REFERENCES Branches(BranchID) -- Relacja jeden do wielu: Jeden oddział może mieć wiele kont
);

-- Cards (Karty)
CREATE TABLE Cards (
    CardID NUMBER PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    CardNumber VARCHAR(16) NOT NULL,
    ExpirationDate DATE NOT NULL,
    CVV VARCHAR(3) NOT NULL,
    CardType VARCHAR(20),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) -- Relacja jeden do wielu: Jeden klient może mieć wiele kart
);

-- TransactionLimits (Limity transakcji)
CREATE TABLE TransactionLimits (
    LimitID NUMBER PRIMARY KEY,
    CardID NUMBER NOT NULL,
    DailyLimit NUMBER(15, 2),
    MonthlyLimit NUMBER(15, 2),
    FOREIGN KEY (CardID) REFERENCES Cards(CardID) -- Relacja jeden do jednego: Jedna karta ma jedne limity transakcji
);

-- TransactionHistory (Historia transakcji)
CREATE TABLE TransactionHistory (
    TransactionID NUMBER PRIMARY KEY,
    CardID NUMBER NOT NULL,
    TransactionDate DATE DEFAULT SYSDATE,
    Amount NUMBER(15, 2),
    MerchantName VARCHAR(100),
    FOREIGN KEY (CardID) REFERENCES Cards(CardID) -- Relacja jeden do wielu: Jedna karta może mieć wiele transakcji
);

-- LoginHistory (Historia logowania)
CREATE TABLE LoginHistory (
    LoginID NUMBER PRIMARY KEY,
    CustomerID NUMBER NOT NULL,
    LoginDate DATE DEFAULT SYSDATE,
    IPAddress VARCHAR(45),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) -- Relacja jeden do wielu: Jeden klient może mieć wiele logowań
);

-- CustomerAccounts (Relacja wiele do wielu między klientami a kontami)
CREATE TABLE CustomerAccounts (
    CustomerID NUMBER NOT NULL,
    AccountID NUMBER NOT NULL,
    PRIMARY KEY (CustomerID, AccountID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID), -- Relacja wiele do wielu: Jeden klient może mieć wiele kont, jedno konto może być przypisane do wielu klientów
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);
