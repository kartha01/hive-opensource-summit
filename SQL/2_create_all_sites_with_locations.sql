use energy;
add jar /local0/DATA/energy/hive-udf/hiveudfs-0.0.1-SNAPSHOT-jar-with-dependencies.jar;
create temporary function locationlookup as 'ibm.opensource.summit.LocationLookup';
--select id, c1, locationlookup(34.78300117,-106.8952497) from test1;

drop table all_sites_w_locations;
create table all_sites_w_locations(
siteid int,
industry string,
sub_industry string,
sq_ft int,
lat double,
lon double,
time_zone string,
tz_offset string,
location string
);

insert into table all_sites_w_locations select siteid,industry,sub_industry,sq_ft, lat, lon,time_zone,tz_offset, locationlookup(lat,lon) from all_sites where siteid is not null;
select count(*) from all_sites_w_locations;
