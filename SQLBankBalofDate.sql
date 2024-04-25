drop procedure if exists getBalanceDetails(1004,'2023-11-25');

CREATE OR REPLACE function getBalanceDetailss(accnum INT, givenDate DATE)
returns numeric
LANGUAGE plpgsql
AS $$
DECLARE 
    withdrawAmount NUMERIC := 0;
    depositAmount NUMERIC := 0;
    balance NUMERIC := 0;
BEGIN
    -- Calculate total deposit amount
	raise notice 'givenDate %',givenDate; 
    SELECT SUM("Amount") INTO depositAmount
    FROM "dmvp_Transaction_"
    WHERE "Transc_Type" = 'D' AND "Transc_Date" BETWEEN givenDate AND current_date and "AccNoT" = accnum;
    RAISE NOTICE 'Final depositAmount: %', depositAmount;

    
    -- Calculate total withdrawal amount
    SELECT SUM("Amount") INTO withdrawAmount
    FROM "dmvp_Transaction_"
    WHERE "Transc_Type" = 'W' AND "Transc_Date" BETWEEN givenDate AND current_date and "AccNoT" = accnum;
    RAISE NOTICE 'Final withdrawAmount: %', withdrawAmount;

    
    -- Get the balance of the account
    SELECT "Balance" INTO balance
    FROM "dmvp_Account_"
    WHERE "AccNo" = accnum;
    
    -- Calculate the final balance
    balance := (balance + COALESCE(depositAmount, 0) - COALESCE(withdrawAmount, 0));
    
    -- Print the final balance
    RAISE NOTICE 'Final balance: %', balance;
	
	return balance;
END;
$$;
select getBalanceDetailss(1003,'2023-11-20');

