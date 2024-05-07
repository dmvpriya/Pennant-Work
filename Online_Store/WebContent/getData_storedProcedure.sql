CREATE OR REPLACE PROCEDURE getData(
    IN getSelectedCategory INT,
    IN getMinPrice INT,
    IN getMaxPrice INT,
    IN serverName VARCHAR(20)
)
LANGUAGE plpgsql
AS $$
declare
	

	prod_record RECORD;
	prod_cursor CURSOR select * from dmvp_products_;


BEGIN
    IF serverName IS NOT NULL AND serverName = 'ProductServlet' THEN
		open prod_cursor;
		loop
			fetch prod_cursor into prod_record;
			exit when not found;

			prod_id := prod_record.prod_id;
			prod_name := prod_record.prod_name;
			prod_price := prod_record.prod_price;
			prod_gst := prod_record.prod_gst;
			prod_image := prod_record.prod_image;
			prod_category_id := prod_record.prod_category_id;
		end loop;
		close prod_cursor;
    END IF;
END;
$$;
