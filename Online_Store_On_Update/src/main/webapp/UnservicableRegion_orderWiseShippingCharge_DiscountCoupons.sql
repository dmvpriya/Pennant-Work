-- Create the OrderValueWiseShippingCharges table
CREATE TABLE OrderValueWiseShippingCharges (
    orvl_id SERIAL PRIMARY KEY,
    orvl_from NUMERIC(10, 2),
    orvl_to NUMERIC(10, 2),
    orvl_shippingamount NUMERIC(10, 2)
);

-- Insert records into the OrderValueWiseShippingCharges table
INSERT INTO OrderValueWiseShippingCharges (orvl_from, orvl_to, orvl_shippingamount) VALUES
(0, 2000, 100),
(2001, 4000, 150),
(4001, 6000, 200),
(6001, 8000, 250),
(8001, 10000, 300),
(10001, 12000, 350),
(12001, 14000, 400),
(14001, 16000, 450),
(16001, 18000, 500),
(18001, 20000, 550);


create table Un_Serviceable_Regions(prod_id varchar,pin_code_unavailability_service_ int);

insert into Un_Serviceable_Regions(prod_id,pin_code_unavailability_service_)values
	('A1',545002),
	('A1',567031),
	('A2',535001),
	('A2',555001),
	('A3',500001),
	('A3',545005),
	('A3',545002),
	('A3',535001),
	('A4',555001),
	('A4',535003),
	('A4',500008),
	('A5',535003),
	('A5',567301),
	('A5',545005),
	('A6',555001),
	('A6',500008),
	('A7',535001),
	('A7',545002),
	('A7',587002),
	('A7',567031),
	('A8',535001),
	('A8',545002),
	('A9',567031),
	('A9',535001),
	('A10',545002),
	('A10',567031),
	('A10',535001);
	
create table discount_coupon(dcpn_id int primary key, dcpn_code varchar(30), dcpn_disValue int, dcpn_noc int);

insert into discount_coupon values(205513901,'DISCOUP45561101',30,100);
insert into discount_coupon values(205513902,'DISCOUP45561102',40,100);
insert into discount_coupon values(205513903,'DISCOUP45561103',50,100);
insert into discount_coupon values(205513904,'DISCOUP45561104',60,100);
