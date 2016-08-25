add jar /local0/GIT/HIVE/hive-opensource-summit/target/hiveudfs-0.0.1-SNAPSHOT-jar-with-dependencies.jar;
create temporary function locationlookup as 'ibm.opensource.summit.LocationLookup';
select id, c1, locationlookup(34.78300117,-106.8952497) from test1;


create temporary function weatherlookup as 'ibm.opensource.summit.WeatherLookup';
select id, c1,weatherlookup('ba428xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx','87031','20121001') from test1;
