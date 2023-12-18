use myDB; 



-- �θ� ���̺��� �ٸ� ���̺����� �����ϱ� ������ ������ �Ұ��� : cascade constraints
/*
drop table Members cascade constraints;  
drop table Addresses cascade constraints;
drop table Products cascade constraints;  
drop table Orders cascade constraints;
*/ 

/* 
    int : 4byte  === > NUMBER (4)
    
    -- NUMBER : Oracle , ����, �Ǽ� 
    NUMBER (4) : ���� 4�ڸ��� �Է� 
    NUMBER (10, 2) : �Ǽ� , ��ü 10�ڸ�, �Ҽ������� 2�ڸ� 
    
    int : MS-SQL, MySQL 
    Varchar : MS-SQL, MySQL 
    
    Varchar2 (10) : ����Ŭ������ ����Ǵ� �ڷ��� : varchar ===> varchar2 
    
*/ 


/* 
	DML : Ʈ������� �۵� ( Insert, Update, Delete )  
		MS-SQL, MY-SQL �ڵ� Ŀ�� Ʈ����� 

*/ 


-- Members ���̺�
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(20) 
);

-- Addresses ���̺�
CREATE TABLE Addresses (
    AddressID INT PRIMARY KEY,
    MemberID INT,
    AddressLine1 VARCHAR(100),
    AddressLine2 VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(20),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Products ���̺�
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price float,
    Description VARCHAR(500)
);

-- Orders ���̺�
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    MemberID INT,
    ProductID INT,
    OrderDate DATE,
    Quantity INT,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- Members ���̺��� ���ڵ� 5�� ����
INSERT INTO Members (MemberID, FirstName, LastName, Email, PhoneNumber)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '1234567890');

INSERT INTO Members (MemberID, FirstName, LastName, Email, PhoneNumber)
VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', '9876543210');

INSERT INTO Members (MemberID, FirstName, LastName, Email, PhoneNumber)
VALUES (3, 'David', 'Johnson', 'david.johnson@example.com', '5555555555');

INSERT INTO Members (MemberID, FirstName, LastName, Email, PhoneNumber)
VALUES (4, 'Sarah', 'Williams', 'sarah.williams@example.com', '9999999999');

INSERT INTO Members (MemberID, FirstName, LastName, Email, PhoneNumber)
VALUES (5, 'Michael', 'Brown', 'michael.brown@example.com', '1111111111');

-- Addresses ���̺��� ���ڵ� 5�� ����
INSERT INTO Addresses (AddressID, MemberID, AddressLine1, AddressLine2, City, State, ZipCode)
VALUES (1, 1, '123 Main St', 'Apt 4B', 'New York', 'NY', '10001');

INSERT INTO Addresses (AddressID, MemberID, AddressLine1, City, State, ZipCode)
VALUES (2, 2, '456 Elm St', 'Los Angeles', 'CA', '90001');

INSERT INTO Addresses (AddressID, MemberID, AddressLine1, City, State, ZipCode)
VALUES (3, 3, '789 Oak Ave',  'Chicago', 'IL', '60601');

INSERT INTO Addresses (AddressID, MemberID, AddressLine1, AddressLine2, City, State, ZipCode)
VALUES (4, 4, '321 Pine St', 'Suite 10', 'Seattle', 'WA', '98101');

INSERT INTO Addresses (AddressID, MemberID, AddressLine1, City, State, ZipCode)
VALUES (5, 5, '555 Maple Dr', 'Dallas', 'TX', '75201');

-- Products ���̺��� ���ڵ� 5�� ����
INSERT INTO Products (ProductID, ProductName, Price, Description)
VALUES (1, 'iPhone 12', 999.99, 'Latest iPhone model');

INSERT INTO Products (ProductID, ProductName, Price, Description)
VALUES (2, 'Samsung Galaxy S21', 899.99, 'Flagship Android smartphone');

INSERT INTO Products (ProductID, ProductName, Price, Description)
VALUES (3, 'MacBook Pro', 1999.99, 'Powerful laptop for professionals');

INSERT INTO Products (ProductID, ProductName, Price, Description)
VALUES (4, 'Sony PlayStation 5', 499.99, 'Next-gen gaming console');

INSERT INTO Products (ProductID, ProductName, Price, Description)
VALUES (5, 'Amazon Echo Dot', 49.99, 'Smart speaker with voice assistant');

-- Orders ���̺��� ���ڵ� 5�� ����
INSERT INTO Orders (OrderID, MemberID, ProductID, OrderDate, Quantity)
VALUES (1, 1, 1, '23/01/01', 3);

INSERT INTO Orders (OrderID, MemberID, ProductID, OrderDate, Quantity)
VALUES (2, 2, 4, '23/02/01', 5);

INSERT INTO Orders (OrderID, MemberID, ProductID, OrderDate, Quantity)
VALUES (3, 5, 5, '23/03/13', 2);

INSERT INTO Orders (OrderID, MemberID, ProductID, OrderDate, Quantity)
VALUES (4, 3, 4, '23/05/1', 7);

INSERT INTO Orders (OrderID, MemberID, ProductID, OrderDate, Quantity)
VALUES (5, 3, 5, '23/01/01', 2);

-- Ansi Join 
/*
select * from members; 
select * from addresses; 
select * from products; 
select * from orders; 
*/


-- 1. INNER JOIN : ANSI ȣȯ���� JOIN
	-- �ֹ����� �̸�, ��ȭ��ȣ, �ּ�, ��ǰ��, ��ǰ����, ���ų�¥, ������ǰ ������ ���
	select LastName, FirstName, PhoneNumber, City, a.AddressID, p.ProductID, ProductName, Price, OrderDate, Quantity
		from members m
			JOIN Orders o
				ON m.memberID = o.memberID
			JOIN Products p
				ON p.ProductID = o.ProductID
			JOIN Addresses a
				ON m.memberID = a.memberID;


-- 2. OUTER JOIN
	-- �ֹ����� �ʴ� ����� ������ ���
	select *
	from orders o
		right outer join members m
			ON o.memberID = m.memberID
	where orderID is null;

	-- �ֹ����� ���� ��ǰ ������ ���
	select *
	from orders o
		right outer join products p
			on o.ProductID = p.ProductID
	where orderID is null;

	select productName
	from orders o
		right outer join products p
			on o.ProductID = p.ProductID
	where orderID is null;

	--
	select LastName
		from members m
			left outer join orders o
				on m.memberID = o.memberID
	where orderID is null;