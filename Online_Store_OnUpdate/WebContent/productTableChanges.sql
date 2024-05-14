alter table dmvp_products_ 
	drop column prod_gst;

alter table dmvp_products_
	add column prod_discount int;

ALTER TABLE dmvp_products_
ALTER COLUMN prod_id TYPE varchar;

UPDATE dmvp_products_
SET prod_discount = 5 
WHERE prod_id = 'A1';

UPDATE dmvp_products_
SET prod_hsn_code = 'ABC02' 
WHERE prod_id = 'A2';

UPDATE dmvp_products_
SET prod_hsn_code = 'ABC03' 
WHERE prod_id = 'A3';

UPDATE dmvp_products_
SET prod_hsn_code = 'ABC04' 
WHERE prod_id = 'A4';

UPDATE dmvp_products_
SET prod_hsn_code = 'ABC05' 
WHERE prod_id = 'A5';

UPDATE dmvp_products_
SET prod_hsn_code = 'ABC06' 
WHERE prod_id = 'A6';

UPDATE dmvp_products_
SET prod_hsn_code = 'ABC07' 
WHERE prod_id = 'A7';

UPDATE dmvp_products_
SET prod_hsn_code = 'ABC08' 
WHERE prod_id = 'A8';

UPDATE dmvp_products_
SET prod_hsn_code = 'ABC09' 
WHERE prod_id = 'A9';

UPDATE dmvp_products_
SET prod_hsn_code = 'ABC10' 
WHERE prod_id = 'A10';

ALTER TABLE dmvp_un_serviceable_regions_
DROP CONSTRAINT dmvp_un_serviceable_regions__product_id_fkey;

ALTER TABLE dmvp_un_serviceable_regions_
ALTER COLUMN prod_id TYPE varchar;

UPDATE dmvp_un_serviceable_regions_
SET prod_id = 'A' || prod_id::varchar;

UPDATE dmvp_products_
SET prod_id = 'A' || prod_id;

ALTER TABLE dmvp_order_products_
ADD CONSTRAINT dmvp_order_products__product_id_fkey
FOREIGN KEY (product_id) REFERENCES dmvp_products_(prod_id);

UPDATE dmvp_products_
SET prod_discount = 5 
WHERE prod_id = 'A1';

UPDATE dmvp_products_
SET prod_discount = 9 
WHERE prod_id = 'A2';

UPDATE dmvp_products_
SET prod_discount = 11 
WHERE prod_id = 'A3';

UPDATE dmvp_products_
SET prod_discount = 13 
WHERE prod_id = 'A4';

UPDATE dmvp_products_
SET prod_discount = 7 
WHERE prod_id = 'A5';

UPDATE dmvp_products_
SET prod_discount = 4 
WHERE prod_id = 'A6';

UPDATE dmvp_products_
SET prod_discount = 9 
WHERE prod_id = 'A7';

UPDATE dmvp_products_
SET prod_discount = 5 
WHERE prod_id = 'A8';

UPDATE dmvp_products_
SET prod_discount = 10 
WHERE prod_id = 'A9';

UPDATE dmvp_products_
SET prod_discount = 12 
WHERE prod_id = 'A10';



