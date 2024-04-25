-- sample view example
-- create or replace view TranscOfAccounts 
-- as
-- SELECT a."AccNo",a."Opening_Date",a."Balance" AS Current_Balance,
--     (SELECT COUNT(*) 
-- 	 FROM "dmvp_Transaction_" t
-- 	 WHERE t."AccNoT" = a."AccNo"
--     GROUP BY t."AccNoT")
-- FROM 
--     "dmvp_Account_" a
-- ORDER BY 
--     a."AccNo" ASC;
-- select * from TranscOfAccounts;

-- view to delete the record and to raise a trigger instead of on it to perform delete in main table
create or replace view ErasingRecords
as 
select * from "dmvp_Transaction_";

select * from ErasingRecords;
delete from ErasingRecords where "AccNoT" = 1004 and "Transc_Date" ='2022-10-10' ;


-- function to perform after trigger
CREATE OR REPLACE FUNCTION deletingRecords()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
DECLARE 
    tr_date date;
BEGIN
    -- Selecting transaction date for the given account
    SELECT "Transc_Date" INTO tr_date FROM "dmvp_Transaction_"
    WHERE "AccNoT" = OLD."AccNoT" AND "Transc_Date" = OLD."Transc_Date";
    
    -- If transaction date matches the requested date, delete the record
    IF FOUND AND tr_date = OLD."Transc_Date" THEN
        DELETE FROM "dmvp_Transaction_" WHERE "AccNoT" = OLD."AccNoT" AND "Transc_Date" = OLD."Transc_Date";
        RETURN OLD;
    END IF;
    
    RETURN NULL;
END;
$$;


-- instead of trigger on view when a delete is performed
create trigger triggerOnDeletingTransc
instead of delete on ErasingRecords
for each row
execute function deletingRecords();