select * from "dmvp_Account_" cross join "dmvp_Transaction_";

select * from "dmvp_Account_" a inner join "dmvp_Transaction_" t on a."AccNo" = t."AccNoT";

select * from "dmvp_Account_" a left join "dmvp_Transaction_" t on a."AccNo" = t."AccNoT";

select * from "dmvp_Account_" a right join "dmvp_Transaction_" t on a."AccNo" = t."AccNoT";

select * from "dmvp_Account_" a full join "dmvp_Transaction_" t on a."AccNo" = t."AccNoT";

select * from "dmvp_Account_" a join "dmvp_Account_" t on a."AccNo" = t."AccNo";


