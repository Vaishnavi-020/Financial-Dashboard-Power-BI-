create database Financial_data;
use Financial_data;

select * from financial_dataset;

create view v_finance_kpi as
select sum(`Sales`) as Total_Revenue,
	sum(Profit)/NULLIF(sum(Sales), 0) as Profit_Margin,
    sum(`Profit`) as Gross_Profit,
    sum(`Units Sold`) as Total_Units_Sold,
    sum(Sales)/sum(`Units Sold`) as Avg_Selling_Price
from financial_dataset;

select * from v_finance_kpi;
 
create view v_sales_by_segment as
select Segment,sum(Sales) as Total_Sales,sum(Profit) as Total_Profit
from financial_dataset
group by Segment;

select * from v_sales_by_segment;

create view v_profit_by_country as
select Country,sum(Profit) as Total_Profit,sum(`Gross Sales`) as Total_Revenue
from financial_dataset
group by Country;

select * from v_profit_by_country;

create view v_Discount_Band as
select `Discount Band`,count(`Discount Band`) as `Number of Discount Bands`
from financial_dataset
group by `Discount Band`;

select * from v_Discount_Band;

