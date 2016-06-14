# Weather_Data_Analysis

The weather Data Analysis Consist of 2 parts.

1)Customzied Weather Data set(WeatherDataset.csv).

2)Apache Pig Script(weather.pig).

Customzied Weather Data:

Customzied Weather Data set containing various Parameters (Weather Station,Date,Humidity,Temperature,Condition,Pressure).


Apache Pig Script:

Apache Pig is scripting Language which used to perform analysis for Big Data.Apache Pig Statements will be converted into Java Map reduce Programs and submitted to the hadoop cluster.Apache Pig Script is used transform the Weather Dataset into desired File Format for Further Predictive analysis.we are deriving out the weather condition(Rain,snow,sunny) of the particular date based on the temperature of particular day.

Project Execution Steps:


Step 1- we need the save the (WeatherDataset.csv) in HDFS Location.

Step 2- we need the pass the Input file Hdfs Location of the weather data set in Pig Script(weather.pig) 


EX:

A = load 'hdfs://dox/user/ramacha2/wd' using PigStorage(',') as(Station:chararray,Time:chararray,Temperature:float,Pressure:chararray,Humidty:chararray);


Change this path (hdfs://dox/user/ramacha2/wd) in variable A into HDFS location where file saved.


 
Step 3- we need the pass the Output directory Location in Pig Script(weather.pig)


EX:

STORE G INTO 'Pig_output' USING PigStorage ('|');

Change this path (Pig_output) into HDFS location where output have to be stored.


Step 4-

After Modifying changes,execute the pig script.

EX:

pig weather.pig


Note:We need to have Apache Pig Version 0.14 to execute the script. 


 


