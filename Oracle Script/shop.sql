

CREATE TABLE "members" (
	"memberID"	number(4)		NOT NULL,
	"zipcode"	number(6)		NOT NULL,
	"lastName"	varchar2(50)		NULL,
	"firstName"	varchar2(50)		NULL,
	"email"	varchar2(100)		NULL,
	"phoneNumber"	varchar2(20)		NOT NULL,
	"addr"	varchar2(50)		NULL,
	"addr2"	varchar2(50)		NULL
);

CREATE TABLE "address" (
	"zipcode"	number(6)		NOT NULL,
	"si_do"	varchar2(50)		NULL,
	"gu_gun"	varchar2(50)		NULL,
	"bungi"	varchar(50)		NULL
);

CREATE TABLE "products" (
	"productID"	number(4)		NOT NULL,
	"proName"	varchar2(100)		NULL,
	"price"	number(10,2)		NULL,
	"cnt"	number(4)		NULL,
	"description"	varchar2(2000)		NULL
);

CREATE TABLE "orders" (
	"orderID"	number(4)		NOT NULL,
	"memberID"	number(4)		NOT NULL,
	"productID"	number(4)		NOT NULL,
	"orderDate"	date		NULL,
	"orderCNT"	number(4)		NULL
);

ALTER TABLE "members" ADD CONSTRAINT "PK_MEMBERS" PRIMARY KEY (
	"memberID"
);

ALTER TABLE "address" ADD CONSTRAINT "PK_ADDRESS" PRIMARY KEY (
	"zipcode"
);

ALTER TABLE "products" ADD CONSTRAINT "PK_PRODUCTS" PRIMARY KEY (
	"productID"
);

ALTER TABLE "orders" ADD CONSTRAINT "PK_ORDERS" PRIMARY KEY (
	"orderID"
);

ALTER TABLE "members" ADD CONSTRAINT "FK_address_TO_members_1" FOREIGN KEY (
	"zipcode"
)
REFERENCES "address" (
	"zipcode"
);

ALTER TABLE "orders" ADD CONSTRAINT "FK_members_TO_orders_1" FOREIGN KEY (
	"memberID"
)
REFERENCES "members" (
	"memberID"
);

ALTER TABLE "orders" ADD CONSTRAINT "FK_products_TO_orders_1" FOREIGN KEY (
	"productID"
)
REFERENCES "products" (
	"productID"
);

