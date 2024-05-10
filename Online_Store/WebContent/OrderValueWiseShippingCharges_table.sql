-- Create the OrderValueWiseShippingCharges table
CREATE TABLE dmvp_OrderValueWiseShippingCharges_ (
    orvl_id SERIAL PRIMARY KEY,
    orvl_from NUMERIC(10, 2),
    orvl_to NUMERIC(10, 2),
    orvl_shippingamount NUMERIC(10, 2)
);

-- Insert records into the OrderValueWiseShippingCharges table
INSERT INTO dmvp_OrderValueWiseShippingCharges_ (orvl_from, orvl_to, orvl_shippingamount) VALUES
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

