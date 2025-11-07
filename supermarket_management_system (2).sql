SUPERMARKET MANAGEMENT SYSTEM 
-- DDL: Create Sequences and Tables -- Sequence and Table for Categories 
CREATE SEQUENCE Categories_seq START WITH 1 INCREMENT BY 1; 
CREATE TABLE Categories ( 
CategoryID NUMBER PRIMARY KEY, 
CategoryName VARCHAR2(50) NOT NULL, 
Description CLOB 
); 
CREATE OR REPLACE TRIGGER Categories_trigger 
BEFORE INSERT ON Categories 
FOR EACH ROW 
BEGIN 
IF :new.CategoryID IS NULL THEN 
SELECT Categories_seq.NEXTVAL INTO :new.CategoryID FROM dual; 
END IF; 
END; 
/
CREATE SEQUENCE Suppliers_seq START WITH 1 INCREMENT BY 1; 
CREATE TABLE Suppliers ( 
    SupplierID NUMBER PRIMARY KEY, 
    SupplierName VARCHAR2(100) NOT NULL, 
    ContactName VARCHAR2(50), 
    Phone VARCHAR2(20), 
    Email VARCHAR2(100), 
    Address CLOB 
); 
CREATE OR REPLACE TRIGGER Suppliers_trigger 
BEFORE INSERT ON Suppliers 
FOR EACH ROW 
BEGIN 
    IF :new.SupplierID IS NULL THEN 
        SELECT Suppliers_seq.NEXTVAL INTO :new.SupplierID FROM dual; 
    END IF; 
END; 
/
CREATE SEQUENCE Products_seq START WITH 1 INCREMENT BY 1; 
CREATE TABLE Products ( 
    ProductID NUMBER PRIMARY KEY, 
    ProductName VARCHAR2(100) NOT NULL, 
    CategoryID NUMBER, 
    SupplierID NUMBER, 
    UnitPrice NUMBER(10, 2) NOT NULL, 
    Description CLOB, 
    ManufactureDate DATE, 
    ExpiryDate DATE, 
    CONSTRAINT fk_Category FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID), 
    CONSTRAINT fk_Supplier FOREIGN KEY (SupplierID) REFERENCES Suppliers(SupplierID) 
); 
CREATE OR REPLACE TRIGGER Products_trigger 
BEFORE INSERT ON Products 
FOR EACH ROW 
BEGIN 
    IF :new.ProductID IS NULL THEN 
        SELECT Products_seq.NEXTVAL INTO :new.ProductID FROM dual; 
    END IF; 
END; 
/
