use energy;
add jar /local0/DATA/energy/hive-udf/json-serde-1.3.8-SNAPSHOT-jar-with-dependencies.jar;

SET mapred.child.java.opts="-XX:+UseConcMarkSweepGC -XX:-UseGCOverheadLimit";

set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set mapred.reduce.tasks=12;
set mapred.map.tasks=12;

drop table exploded_sites_daily_weather_params_final;

create table exploded_sites_daily_weather_params_final
(
zipcode string,
site_date string,
valid_time_gmt bigint,
day_ind string,
temp int,
wx_phrase string,
dewPt int,
heat_index int,
rh int,
pressure double,
vis double,
wc int,
wspd int,
uv_desc string,
feels_like int,
uv_index int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
;
INSERT INTO TABLE exploded_sites_daily_weather_params_final
select
zipcode as zipcode,
site_date as site_id,
o.valid_time_gmt as valid_time_gmt, 
o.day_ind as day_ind, 
o.temp as temp, 
o.wx_phrase as wx_phrase, 
o.dewPt as dewPt,
o.heat_index as heat_index,
o.rh as rh, 
o.pressure as pressure,
o.vis as vis, 
o.wc as wc, 
o.wspd as wspd,
o.uv_desc as uv_desc, 
o.feels_like as feels_like, 
o.uv_index as uv_index
from sites_with_daily_weather_EXT_SERDE
LATERAL VIEW explode(observations) exploded_table as o;

select count(*) from exploded_sites_daily_weather_params_final;
