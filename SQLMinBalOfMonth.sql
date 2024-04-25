--drop procedure if exists getMinBalanceOfMonth(int, int, int);

create or replace procedure getMinBalanceOfMonth(accnum int,givenMonth int,givenYear int)
language plpgsql
as $$
declare 
	withdrawAmount numeric:=0;
	depositAmount numeric:=0;
	balance numeric:=0;	
	i int := 0;
	balanceArray numeric[];
	firstDayOfMonth date;
	lastDayOfMonth date;
	minBalance numeric:=0;
begin

	firstDayOfMonth = MAKE_DATE(givenYear,givenMonth,10);
	lastDayOfMonth = firstDayOfMonth + interval '1 Month'- interval '1 day';
	
	loop		
	-- Calculate total deposited amount
		SELECT SUM("Amount") INTO depositAmount
    	FROM "dmvp_Transaction_"
    	WHERE "Transc_Type" = 'D' AND "Transc_Date" BETWEEN firstDayOfMonth AND current_date and "AccNoT" = accnum;
    	RAISE NOTICE 'Final depositAmount: %', depositAmount;
		
    -- Calculate total withdrawal amount
    	SELECT SUM("Amount") INTO withdrawAmount
    	FROM "dmvp_Transaction_"
    	WHERE "Transc_Type" = 'W' AND "Transc_Date" BETWEEN firstDayOfMonth AND current_date and "AccNoT" = accnum;
    	RAISE NOTICE 'Final withdrawAmount: %', withdrawAmount;

    
    -- Get the balance of the account
    	SELECT "Balance" INTO balance
    	FROM "dmvp_Account_"
    	WHERE "AccNo" = accnum;
    
    -- Calculate the final balance
    	balance := (balance + COALESCE(depositAmount, 0) - COALESCE(withdrawAmount, 0));
		
	-- Updating balance
		balanceArray = array_append(balanceArray, balance);
    
    -- Print the final balance
    	RAISE NOTICE 'Final balance: %', balance;
		RAISE NOTICE 'Balance array: %', balanceArray;
		
		i = i+1;
		firstDayOfMonth = MAKE_DATE(givenYear,givenMonth,i+1);
		
		if(firstDayOfMonth = lastDayOfMonth) then
			exit;		
	 	END IF;
	 	
    END LOOP;
	select min(value) into minBalance from (select unnest(balanceArray) as value)as unnested_values;
	raise notice 'Minimum balance of the month : %', minBalance;
end;
$$;

call getMinBalanceOfMonth(1003,11,2023);