CREATE FUNCTION GetAllProducts()
RETURNS TABLE (
    prod_id VARCHAR(50),
    prod_name VARCHAR(255),
    prod_price INT,
    prod_gst INT,
    prod_image VARCHAR(255),
    prod_category_id INT
)
AS $$
BEGIN
    RETURN QUERY SELECT * FROM dmvp_products_;
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION GetAllCategories()
RETURNS TABLE (
    prod_category_id INT,
    prod_category_name VARCHAR(255)
)
AS $$
BEGIN
    RETURN QUERY SELECT * FROM dmvp_products_category_;
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION GetProductsByCategoryAndPriceRange(categoryId INT, minPrice INT, maxPrice INT)
RETURNS TABLE (
    prod_id VARCHAR(50),
    prod_name VARCHAR(255),
    prod_price INT,
    prod_gst INT,
    prod_image VARCHAR(255),
    prod_category_id INT
)
AS $$
BEGIN
    RETURN QUERY SELECT * FROM dmvp_products_
                 WHERE prod_category_id = categoryId
                 AND prod_price BETWEEN minPrice AND maxPrice;
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION GetShippingChargesForProductPrice(productPrice INT)
RETURNS TABLE (
    orvl_shippingamount INT
)
AS $$
BEGIN
    RETURN QUERY SELECT orvl_shippingamount
                 FROM dmvp_ordervaluewiseshippingcharges_
                 WHERE orvl_from <= productPrice AND orvl_to >= productPrice;
END;
$$ LANGUAGE plpgsql;


CREATE FUNCTION CheckPinCodeExists(pinCode INT)
RETURNS BOOLEAN
AS $$
DECLARE
    pinExists BOOLEAN;
BEGIN
    SELECT COUNT(*) > 0 INTO pinExists
    FROM dmvp_ServiceableRegions_
    WHERE srrg_pinfrom = pinCode OR srrg_pinto = pinCode;

    RETURN pinExists;
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
    pinCodeExists BOOLEAN;
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
        SELECT CheckPinCodeExists(pinCode) INTO pinCodeExists;
        result.pin_code_exists := pinCodeExists;
    END IF;
    RETURN result;
END;
$$ LANGUAGE plpgsql;






