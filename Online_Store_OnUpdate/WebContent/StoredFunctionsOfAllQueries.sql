CREATE or replace FUNCTION GetAllProducts()
RETURNS TABLE (
    prod_id VARCHAR(50),
    prod_name VARCHAR(255),
    prod_price INT,
    prod_image VARCHAR(255),
    prod_category_id INT,
	prod_hsn_code varchar(50),
	prod_discount int
)
AS $$
BEGIN
    RETURN QUERY SELECT * FROM products;
END;
$$ LANGUAGE plpgsql;



CREATE FUNCTION GetAllCategories()
RETURNS TABLE (
    prod_category_id INT,
    prod_category_name VARCHAR(255)
)
AS $$
BEGIN
    RETURN QUERY SELECT * FROM products_category;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION GetProductsByCategoryAndPriceRange(categoryId INT, minPrice INT, maxPrice INT)
RETURNS TABLE (
    prod_id VARCHAR(50),
    prod_name VARCHAR(255),
    prod_price INT,
    prod_image VARCHAR(255),
    prod_category_id INT,
	prod_hsn_code varchar(50),
	prod_discount int
)
AS $$
BEGIN
    RETURN QUERY SELECT * FROM products p
                 WHERE p.prod_category_id = categoryId and
                 p.prod_price BETWEEN minPrice AND maxPrice;
END;
$$ LANGUAGE plpgsql;



CREATE or replace FUNCTION GetShippingChargesForProductPrice(productPrice INT)
RETURNS int
AS $$
DECLARE
	shippingCharges int;
BEGIN
    SELECT orvl_shippingamount into shippingCharges
    FROM ordervaluewiseshippingcharges
    WHERE orvl_from <= productPrice AND orvl_to >= productPrice;
	return shippingCharges;
END;
$$ LANGUAGE plpgsql;





CREATE or replace FUNCTION CheckPinCodeExists(product_id varchar,pinCode INT)
RETURNS Boolean
AS $$
DECLARE
    pinExists BOOLEAN;
BEGIN
    SELECT COUNT(*) > 0 INTO pinExists
    FROM Un_Serviceable_Regions
    WHERE pin_code_unavailability_service_ = pinCode and prod_id = product_id;

    RETURN pinExists;
END;
$$ LANGUAGE plpgsql;


create or replace function getGst(hsn_code_value varchar)
returns int
as $$
declare
	gst_value int;
begin
	select gst into gst_value from hsn_codes where hsn_code = hsn_code_value;
	return gst_value;
end;
$$ language plpgsql;



create or replace function getDisCoupData(disValue int)
returns table(
	dcpn_id int,
	dcpn_code varchar,
	dcpn_disValue int,
	dcpn_noc int
)
As $$
begin
	return query select * from discount_coupon dc where dc.dcpn_disValue = disValue;
end;
$$ language plpgsql;

CREATE OR REPLACE FUNCTION getOrderProducts(productId varchar)
RETURNS TABLE(
    order_id VARCHAR,
    product_id VARCHAR,
    order_quantity INT,
    order_price INT,
    dcpn_id INT
)
AS $$
BEGIN
    RETURN QUERY SELECT * FROM order_products op WHERE op.product_id = productId;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE PROCEDURE setOrderProducts(
    productId VARCHAR,
    quantity INT,
    price INT,
    dcpn_id INT
)
AS $$
DECLARE 
    orderId VARCHAR;
    currDate VARCHAR;
    randomDigits VARCHAR;
BEGIN
    -- Generate random 4-digit number
    randomDigits := LPAD(CAST(FLOOR(RANDOM() * 10000) AS VARCHAR), 4, '0');
    
    -- Generate current date
    currDate := TO_CHAR(CURRENT_DATE, 'YYYYMMDD');
    
    -- Construct order ID
    orderId := currDate || randomDigits || 'ORD';
    
    -- Insert into order_products table
    INSERT INTO order_products (order_id, product_id, quantity, dcpn_id, price)
    VALUES (orderId, productId, quantity, dcpn_id, price);
END;
$$ LANGUAGE plpgsql;



CREATE TYPE AllOperationResults AS (
    products REFCURSOR,
    categories REFCURSOR,
    products_by_category REFCURSOR,
    shipping_charges REFCURSOR,
    orders REFCURSOR,
    pin_code_exists BOOLEAN
);

CREATE FUNCTION ExecuteOperations(servletName VARCHAR) 
RETURNS AllOperationResults 
AS $$
DECLARE
    productsCursor REFCURSOR;
    categoriesCursor REFCURSOR;
    productsByCategoryCursor REFCURSOR;
    shippingChargesCursor REFCURSOR;
    ordersCursor REFCURSOR;
    pinCodeExists REFCURSOR;
    result AllOperationResults;
BEGIN
    IF servletName = 'ProductServlet' THEN
        OPEN productsCursor FOR SELECT * FROM GetAllProducts();
        result.products := productsCursor;
    ELSIF servletName = 'CategoryServlet' THEN
        OPEN categoriesCursor FOR SELECT * FROM GetAllCategories();
        result.categories := categoriesCursor;
    ELSIF servletName = 'CategoryProductServlet' THEN
        OPEN productsByCategoryCursor FOR SELECT * FROM GetProductsByCategoryAndPriceRange(1, 0, 10000); -- Assuming default values for category, minPrice, and maxPrice
        result.products_by_category := productsByCategoryCursor;
    ELSIF servletName = 'ShippingServlet' THEN
        OPEN shippingChargesCursor FOR SELECT * FROM GetShippingChargesForProductPrice(0); -- Assuming default value for productPrice
        result.shipping_charges := shippingChargesCursor;
    ELSIF servletName = 'OrderServlet' THEN
        OPEN ordersCursor FOR SELECT * FROM GetAllOrders();
        result.orders := ordersCursor;
    ELSIF servletName = 'PinCodeServlet' THEN
        OPEN pincodeExists  FOR SELECT * FROM CheckPinCodeExists(pincode);
        result.pin_code_exists := pinCodeExists;
    END IF;
    RETURN result;
END;
$$ LANGUAGE plpgsql;

