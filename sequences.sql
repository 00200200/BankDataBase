-- Sekwencja dla Klienci (Customers)
CREATE SEQUENCE seq_customer_id
    START WITH 1
    INCREMENT BY 1;

-- Sekwencja dla Adresy (Addresses)
CREATE SEQUENCE seq_address_id
    START WITH 1
    INCREMENT BY 1;

-- Sekwencja dla Działy (Departments)
CREATE SEQUENCE seq_department_id
    START WITH 1
    INCREMENT BY 1;

-- Sekwencja dla Oddziały (Branches)
CREATE SEQUENCE seq_branch_id
    START WITH 1
    INCREMENT BY 1;
-- Sekwencja dla Stanowiska (Positions)
CREATE SEQUENCE seq_position_id
    START WITH 1
    INCREMENT BY 1;

-- Sekwencja dla Pracownicy (Employees)
CREATE SEQUENCE seq_employee_id
    START WITH 1
    INCREMENT BY 1;

-- Sekwencja dla Konta (Accounts)
CREATE SEQUENCE seq_account_id
    START WITH 1
    INCREMENT BY 1;

-- Sekwencja dla Karty (Cards)
CREATE SEQUENCE seq_card_id
    START WITH 1
    INCREMENT BY 1;

-- Sekwencja dla Limity transakcji (TransactionLimits)
CREATE SEQUENCE seq_limit_id
    START WITH 1
    INCREMENT BY 1;

-- Sekwencja dla Historia transakcji (TransactionHistory)
CREATE SEQUENCE seq_transaction_id
    START WITH 1
    INCREMENT BY 1;

-- Sekwencja dla Historia logowania (LoginHistory)
CREATE SEQUENCE seq_login_id
    START WITH 1
    INCREMENT BY 1;

-- Sekwencja dla Typy kont (AccountTypes)
CREATE SEQUENCE seq_account_type_id
    START WITH 1
    INCREMENT BY 1;
