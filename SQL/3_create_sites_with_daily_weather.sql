use energy;
add jar /local0/DATA/energy/hive-udf/hiveudfs-0.0.1-SNAPSHOT-jar-with-dependencies.jar;
create temporary function weatherlookup as 'ibm.opensource.summit.WeatherLookup';

drop table sites_with_daily_weather;
create table sites_with_daily_weather(
weather string
)
partitioned by(zipcode string, site_date string)
;
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.exec.max.dynamic.partitions.pernode=40000;
set hive.exec.max.dynamic.partitions=40000;
set mapred.reduce.tasks=8;

insert into table sites_with_daily_weather
PARTITION(zipcode, site_date)
SELECT  weatherlookup('ba42xxxxxxxxxxxxxxxxxxxxxx',t3.zipcode, t3.site_date ), t3.zipcode, t3.site_date
from
(
	select regexp_replace(to_date(from_utc_timestamp(t1.utc_ts,t2.tz)) ,'-','') as site_date, t1.utc_ts as utc_ts, t2.zipcode as zipcode, t2.tz
	FROM
	(
	select * from sites_usage where epoch_ts is not null) t1
	JOIN
	(
	select a.siteid, a.time_zone as tz, get_json_object(al.location, '$.addresses[0].postCode')as zipcode from (select * from all_sites where siteid is not null) a JOIN (select * from all_sites_w_locations where siteid is not null) al ON a.siteid=al.siteid) t2
	ON t1.siteid=t2.siteid
) t3 group by t3.zipcode, t3.site_date
;
