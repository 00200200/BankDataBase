
-- Niepelne inforamcje o Kliencie
-- Np. takie informacje ma pracownik ktory nie odpowiednich uprawnien
CREATE VIEW vw_customer_info_part AS
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    c.Gender
FROM 
    Customers c;


-- Pelne informacje kliencie
CREATE VIEW vw_customer_info AS
SELECT 
    c.CustomerID,
    c.FirstName,
    c.LastName,
    c.Email,
    c.Phone,
    c.PESEL,
    c.IDNumber,
    c.Gender,
    c.CreatedAt,
    a.Street,
    a.City,
    a.State,
    a.PostalCode,
    a.Country
FROM 
    Customers c
LEFT JOIN 
    Addresses a ON c.CustomerID = a.CustomerID;

    
-- Transakcje kart
DROP VIEW vw_card_transactions;
CREATE VIEW vw_card_transactions AS
SELECT 
    c.CardID,
    c.CardNumber,
    t.TransactionID,
    t.TransactionDate,
    t.Amount,
    t.MerchantName
FROM
    Cards c
JOIN
    TransactionHistory t ON c.CardID = t.CardID;
    
-- Historia logowania klienta
CREATE VIEW vw_login_history AS
SELECT
    lh.LoginID,
    lh.CustomerID,
    c.FirstName,
    c.LastName,
    lh.LoginDate,
    lh.IPAddress
FROM
    LoginHistory lh
JOIN
    Customers c ON lh.CustomerID = c.CustomerID;
    
-- Pełnych informacji o pracownikach
CREATE VIEW vw_employee_info AS
SELECT 
    e.EmployeeID,
    e.FirstName,
    e.LastName,
    e.Email,
    e.Phone,
    d.DepartmentName,
    b.BranchName,
    p.PositionName
FROM 
    Employees e
JOIN 
    Departments d ON e.DepartmentID = d.DepartmentID
JOIN 
    Branches b ON e.BranchID = b.BranchID
JOIN 
    Positions p ON e.PositionID = p.PositionID;
