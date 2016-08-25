use energy;
drop table FINAL_TABLE_ALL_HR_AGG_DATA;
create table FINAL_TABLE_ALL_HR_AGG_DATA
row format delimited fields terminated by ',' COLLECTION ITEMS TERMINATED BY ':'
as
select t1.siteid as siteid, t1.zipcode as t1_zipcode, t1.year as t1_year, t1.month as t1_month, t1.day as t1_day,t1.hour as t1_hour, t1.value as value,
t2.* 
from 
sites_with_aggregated_energy_by_hr_final t1 
left outer join 
sites_daily_weather_with_aggregated_params_by_hr_final t2 
on 
t1.zipcode=t2.zipcode 
and 
t1.year=t2.year 
and 
t1.month=t2.month 
and 
t1.day=t2.day 
and 
t1.hour=t2.hour;

