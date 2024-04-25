create or replace procedure getMinBalanceOfMonthUsingCursors(accnum int,givenYear int,givenMonth int)
language plpgsql
as $$
declare 
	cur cursor for
	select "Transc_Type","Amount"
	from "dmvp_Transaction_"
	where extract(Month from "Transc_Date") = givenMonth 
	and extract(Year from "Transc_Date") = givenYear 
	and extract(day from "Transc_Date")>10 
	and "AccNoT" = accnum order by "Transc_Date" desc;
	
	firstDayOfMonth date;
	DateOfTransc date;
	AccNumber numeric :=0;
	TypeOfTransc varchar(1);
	balanceofFirstDayOfMonth numeric :=0;
	currentYear int := extract(Year from now());
	currentMonth int := extract(Month from now());
	amount numeric :=0;
	minBalance numeric :=0;
	getBalance numeric:=0;
begin
	open cur;
	if(currentMonth = givenMonth and currentYear = givenYear) then
	 	select balance into getBalance 
		from "dmvp_Account_" 
		where "AccNo" = accnum;
	else
		if(currentMonth = 12) then
			givenYear := givenYear + 1;
			givenMonth := 0;
		end if;
		getBalance := getBalanceDetailss(accnum,(givenYear::varchar || '-' ||(givenMonth+1)::varchar|| '-01')::date);
		raise notice 'balance %',getBalance;
	end if;
	minBalance := getBalance;
	loop
		fetch cur into TypeOfTransc,amount;
		exit when not found;
		if(TypeOfTransc = 'D') then
			getBalance := getBalance + amount;
			if(minBalance>getBalance) then 
				minBalance := getBalance;
			end if;
				
		elsif(TypeOfTransc = 'W') then
			getBalance := getBalance + amount;
			if(minBalance>getBalance) then 
				minBalance := getBalance;
			end if;
		end if;
		end loop;
		raise notice 'min balance of month %',minBalance;
	
	
	
	
-- 	select Balance into minBalance from "dmvp_Account_" where "AccNo" = accnum;
-- 	loop
-- 		fetch cur into TypeOfTransc,amount,DateOfTransc;
-- 		exit when not found;
-- 		if(extract(Month from DateOfTransc) = extract(Month from givenDate)) then
-- 		if TypeOfTransc = 'D' then
-- 			balanceofFirstDayOfMonth := balanceofFirstDayOfMonth + amount;
-- 		end if;
-- 		if TypeOfTransc = 'W' then
-- 			balanceofFirstDayOfMonth := balanceofFirstDayOfMonth - amount;
-- 		end if;
		
-- 		if (balance < minBalance) then
-- 		 	minBalance := balance;
-- 		end if;		
-- 		end if;
-- 	end loop;
-- 	raise notice 'Final minBalance of the month %', minBalance;
end;
$$;

call getMinBalanceOfMonthUsingCursors(1003,2022,09);