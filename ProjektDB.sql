-- Skrypt do usunięcia całej bazy danych

-- Usunięcie tabel zależnych
DROP TABLE CustomerAccounts CASCADE CONSTRAINTS;
DROP TABLE TransactionHistory CASCADE CONSTRAINTS;
DROP TABLE TransactionLimits CASCADE CONSTRAINTS;
DROP TABLE LoginHistory CASCADE CONSTRAINTS;
DROP TABLE Cards CASCADE CONSTRAINTS;
DROP TABLE Accounts CASCADE CONSTRAINTS;
DROP TABLE Employees CASCADE CONSTRAINTS;
DROP TABLE Positions CASCADE CONSTRAINTS;
DROP TABLE Branches CASCADE CONSTRAINTS;
DROP TABLE Departments CASCADE CONSTRAINTS;
DROP TABLE Addresses CASCADE CONSTRAINTS;
DROP TABLE Customers CASCADE CONSTRAINTS;
DROP TABLE AccountTypes CASCADE CONSTRAINTS;
DROP TABLE PaymentTypes CASCADE CONSTRAINTS;

-- Usunięcie widoków
DROP VIEW vw_customer_info_part;
DROP VIEW vw_customer_info;
DROP VIEW vw_card_transactions;
DROP VIEW vw_login_history;
DROP VIEW vw_employee_info;

-- Usunięcie indeksów (jeśli nie są usuwane automatycznie z tabelami)
DROP INDEX idx_customers_email;
DROP INDEX idx_customers_pesel;
DROP INDEX idx_customers_idnumber;
DROP INDEX idx_customers_phone;
DROP INDEX idx_addresses_customerid;
DROP INDEX idx_employees_departmentid;
DROP INDEX idx_employees_branchid;
DROP INDEX idx_employees_positionid;
DROP INDEX idx_accounts_accountnumber;
DROP INDEX idx_accounts_accounttypeid;
DROP INDEX idx_accounts_branchid;
DROP INDEX idx_cards_customerid;
DROP INDEX idx_cards_cardnumber;
DROP INDEX idx_transactionhistory_cardid;
DROP INDEX idx_transactionhistory_transactiondate;
DROP INDEX idx_loginhistory_customerid;

-- Usunięcie sekwencji
DROP SEQUENCE seq_customer_id;
DROP SEQUENCE seq_address_id;
DROP SEQUENCE seq_department_id;
DROP SEQUENCE seq_branch_id;
DROP SEQUENCE seq_position_id;
DROP SEQUENCE seq_employee_id;
DROP SEQUENCE seq_account_id;
DROP SEQUENCE seq_card_id;
DROP SEQUENCE seq_limit_id;
DROP SEQUENCE seq_transaction_id;
DROP SEQUENCE seq_login_id;
DROP SEQUENCE seq_account_type_id;
DROP SEQUENCE seq_payment_type_id;
