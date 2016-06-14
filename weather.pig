A = load 'hdfs://dox/user/ramacha2/wd' using PigStorage(',') as(Station:chararray,Time:chararray,Temperature:float,Pressure:chararray,Humidty:chararray);
B = filter A by Station !='Station';
C = FOREACH B GENERATE (
CASE Station
WHEN 'Queensland' THEN 'QUE'
WHEN 'New South Wales' THEN 'NSW'
WHEN 'Victoria' THEN 'VIC'
WHEN 'Tasmania' THEN 'TAS'
WHEN 'South Australia' THEN 'SAT'
WHEN 'Western Australia' THEN 'WAT'
WHEN 'Northern Territory' THEN 'NTT'
END 
)as Station,Time,Temperature,Pressure,Humidty;
D = FOREACH C GENERATE Station,Time,((Temperature< 1) ? 0:((Temperature>=10 and Temperature< 20 ) ? 1:((Temperature> 20) ? 2:Temperature)))as Condition ,Temperature,Pressure,Humidty;
E = FOREACH D GENERATE Station,Time,(
CASE Condition 
WHEN 0 THEN 'Snow'
WHEN 1 THEN 'Rain'
WHEN 2 THEN 'Sunny'
END 
)as Condition,Temperature,Pressure,Humidty;
F = FOREACH E GENERATE Station,SUBSTRING(Time,0,10)as date,SUBSTRING(Time,11,18)as time,Condition,Temperature,Pressure,Humidty;
G = FOREACH F GENERATE Station,CONCAT(date,'T',time,'Z'),Condition,Temperature,Pressure,Humidty;
STORE G INTO 'Pig_output' USING PigStorage ('|');