select `Name`, State, Gross_Profit, Sale_Fiscal_Year, Sale_Fiscal_Qtr from collapse.invoice_facttable 
where `Name` is not NULL
and Sale_Fiscal_Year = 2009
and Sale_Fiscal_Qtr = 3
order by Gross_Profit DESC;

select BusinessName, Sale_Calendar_Year, Quantity from collapse.invoice_facttable 
where BusinessName is not NULL
and Sale_Calendar_Year = 2007
and Quantity > 100
order by Quantity DESC;

#Just for testing
#group by Gross_Profit, State
#group by BusinessName, `Sale_Calendar_Year`