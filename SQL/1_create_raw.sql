use energy;
drop table sites_usage;
create EXTERNAL table sites_usage(
epoch_ts bigint,
utc_ts timestamp,
value double,
estimated int,
anomaly string
)
partitioned by(siteid int)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
location '/DATA/energy/sites';

alter table sites_usage add partition(siteid=10);
alter table sites_usage add partition(siteid=100);
alter table sites_usage add partition(siteid=101);
alter table sites_usage add partition(siteid=103);
alter table sites_usage add partition(siteid=109);
alter table sites_usage add partition(siteid=111);
alter table sites_usage add partition(siteid=116);
alter table sites_usage add partition(siteid=12);
alter table sites_usage add partition(siteid=13);
alter table sites_usage add partition(siteid=136);
alter table sites_usage add partition(siteid=137);
alter table sites_usage add partition(siteid=14);
alter table sites_usage add partition(siteid=144);
alter table sites_usage add partition(siteid=153);
alter table sites_usage add partition(siteid=186);
alter table sites_usage add partition(siteid=197);

alter table sites_usage add partition(siteid=21);
alter table sites_usage add partition(siteid=213);
alter table sites_usage add partition(siteid=214);
alter table sites_usage add partition(siteid=217);
alter table sites_usage add partition(siteid=218);
alter table sites_usage add partition(siteid=22);
alter table sites_usage add partition(siteid=224);
alter table sites_usage add partition(siteid=228);
alter table sites_usage add partition(siteid=236);
alter table sites_usage add partition(siteid=25);
alter table sites_usage add partition(siteid=259);
alter table sites_usage add partition(siteid=270);
alter table sites_usage add partition(siteid=275);
alter table sites_usage add partition(siteid=281);
alter table sites_usage add partition(siteid=285);
alter table sites_usage add partition(siteid=29);


alter table sites_usage add partition(siteid=30);
alter table sites_usage add partition(siteid=304);
alter table sites_usage add partition(siteid=31);
alter table sites_usage add partition(siteid=32);
alter table sites_usage add partition(siteid=339);
alter table sites_usage add partition(siteid=341);
alter table sites_usage add partition(siteid=36);
alter table sites_usage add partition(siteid=363);
alter table sites_usage add partition(siteid=366);
alter table sites_usage add partition(siteid=384);
alter table sites_usage add partition(siteid=386);
alter table sites_usage add partition(siteid=391);
alter table sites_usage add partition(siteid=399);

alter table sites_usage add partition(siteid=400);
alter table sites_usage add partition(siteid=401);
alter table sites_usage add partition(siteid=404);
alter table sites_usage add partition(siteid=41);
alter table sites_usage add partition(siteid=42);
alter table sites_usage add partition(siteid=427);
alter table sites_usage add partition(siteid=44);
alter table sites_usage add partition(siteid=45);
alter table sites_usage add partition(siteid=454);
alter table sites_usage add partition(siteid=455);
alter table sites_usage add partition(siteid=472);
alter table sites_usage add partition(siteid=474);
alter table sites_usage add partition(siteid=475);
alter table sites_usage add partition(siteid=478);
alter table sites_usage add partition(siteid=484);
alter table sites_usage add partition(siteid=49);
alter table sites_usage add partition(siteid=492);
alter table sites_usage add partition(siteid=496);

alter table sites_usage add partition(siteid=51);
alter table sites_usage add partition(siteid=512);
alter table sites_usage add partition(siteid=55);
alter table sites_usage add partition(siteid=56);

alter table sites_usage add partition(siteid=6);
alter table sites_usage add partition(siteid=648);
alter table sites_usage add partition(siteid=65);
alter table sites_usage add partition(siteid=654);
alter table sites_usage add partition(siteid=673);
alter table sites_usage add partition(siteid=674);
alter table sites_usage add partition(siteid=690);
alter table sites_usage add partition(siteid=697);

alter table sites_usage add partition(siteid=703);
alter table sites_usage add partition(siteid=716);
alter table sites_usage add partition(siteid=718);
alter table sites_usage add partition(siteid=731);
alter table sites_usage add partition(siteid=737);
alter table sites_usage add partition(siteid=742);
alter table sites_usage add partition(siteid=744);
alter table sites_usage add partition(siteid=745);
alter table sites_usage add partition(siteid=755);
alter table sites_usage add partition(siteid=761);
alter table sites_usage add partition(siteid=765);
alter table sites_usage add partition(siteid=766);
alter table sites_usage add partition(siteid=767);
alter table sites_usage add partition(siteid=771);
alter table sites_usage add partition(siteid=78);
alter table sites_usage add partition(siteid=786);

alter table sites_usage add partition(siteid=8);
alter table sites_usage add partition(siteid=805);
alter table sites_usage add partition(siteid=808);
alter table sites_usage add partition(siteid=832);
alter table sites_usage add partition(siteid=88);
alter table sites_usage add partition(siteid=887);

alter table sites_usage add partition(siteid=9);
alter table sites_usage add partition(siteid=92);
alter table sites_usage add partition(siteid=99);

select count(*) from sites_usage;

drop table all_sites;
create EXTERNAL table all_sites(
siteid int,
industry string,
sub_industry string,
sq_ft int,
lat double,
lon double,
time_zone string,
tz_offset string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
location '/DATA/energy/all_sites';

select count(*) from all_sites;
