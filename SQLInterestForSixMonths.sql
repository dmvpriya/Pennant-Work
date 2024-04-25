create or replace procedure interestForSixMonths(givenMonth int,givenYear int)
language plpgsql
as $$
declare 
	AccNoCur Cursor for select AccNo from "dmvp_Accounts_";
	accnum numeric:=0;
	interestPeriod numeric :=6;
	firstDayOfSixMonths date;
	lastDayOfMonth date;
	lastDayOfSixMonths date;
	openingDateOfAccount date;
	extractedDate date;
	i int := 0;
	j int := 0;
	l int := 0;
begin
	open AccNoCur;
	firstDayOfSixMonths = Make_Date(givenYear,givenMonth,10);
	lastDayOfMonth = firstDayOfSixMonths+interval'1 month'-interval '1 day';
	loop
		fetch AccNoCur into accnum;
		
	--retrieving the opening date of the month	
		select Opening_Date into openingDateOfAccount
		from "dmvp_Account_";
		
	--initializing the date		
		
		if(firstDayOfSixMonths = lastDayOfMonth) then			
			if(j+givenMonth >12) then				
				givenMonth = 1
				firstDayOfSixMonths = Make_Date(l+givenYear,givenMonth,10);
				l = l+1
			firstDayOfSixMonths = Make_Date(givenYear,j+givenMonth,10);
			j = j+1
		firstDayOfSixMonths = Make_Date(givenYear,givenMonth,i+10);
		i = i+1;
		
	--comparing opening date
		select extract(date from Opening_Date) into extractedDate from "dmvp_Account_"
		if(date >10) then 
			
end;
$$;