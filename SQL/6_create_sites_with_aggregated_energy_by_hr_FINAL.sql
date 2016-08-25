use energy;
drop table  sites_with_aggregated_energy_by_hr_final;
create table sites_with_aggregated_energy_by_hr_final(
siteid int,
zipcode string,
year int,
month int,
day int,
hour int,
value double
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
;

INSERT INTO TABLE sites_with_aggregated_energy_by_hr_final
select siteid, zipcode, year, month, day, hour, sum(value)
from
( 
SELECT t1.siteid as siteid, get_json_object(t2.location, '$.addresses[0].postCode') as zipcode, t2.time_zone as tz, t1.utc_ts, 
year(from_utc_timestamp(t1.utc_ts,t2.time_zone)) as year, 
month (from_utc_timestamp(t1.utc_ts,t2.time_zone)) as month,
day(from_utc_timestamp(t1.utc_ts,t2.time_zone)) as day,
hour(from_utc_timestamp(t1.utc_ts,t2.time_zone))as hour,
t1.value
FROM
all_sites_w_locations t2
JOIN
(select * from sites_usage where epoch_ts is not null ) t1
ON t1.siteid=t2.siteid
) t3 group by siteid, zipcode, year, month, day, hour;
 
