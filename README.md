# Google_Capstone_Project
This is capstone project for analaysis the data from company to analyze and conclude the result in order to data driven decision. 
Bellabeat data analysis case study . In this case study, I will perform many real-world tasks of a junior data analyst. In this secanrio I am  working for Bellabeat, a high-tech manufacturer of health-focused products for women, and meet different characters and team members. In order to answer the key business questions, you will follow the steps of the data analysis process: ask, prepare, process, analyze, share, and act. 

# Tools
--> **SQL**(Data Exploration,Data Manipualtion)


--> **EXCEL**(Data Visualization)


# Business Questions:

1) Finding numbers of users in Bella beat using different datasets ?
2) To find the relationship calories and total steps ?
3) To find and analyze relation between total step and sedentary minutes ?
4) Examine the active and sedentary minutes inn daliy part of life of users ?
5) Calculation of the most active week day on average ?
6) Find the realtion between average sleep on weekdays?
   

# SQL Code(Data Manipualtion and Analysis)


**# Count Number Of Unquie User In FitBand According To Following Activities--**


I have use a distinct command with count to known if there are unique values are there in each column.


**CODE**


    use fitband;

    SELECT Count(distinct ID)  FROM daily_activity;

    SELECT Count(distinct ID)  FROM daily_calories;

    SELECT Count(distinct ID)  FROM daily_intensities;

    SELECT Count(distinct ID)  FROM daily_steps;

    SELECT Count(distinct ID)  FROM sleep_day;

    SELECT Count(distinct ID)  FROM weight_log;

    SELECT Count(distinct ID)  FROM heart_rate;


----------------------------------------------------------------------------------------------------------------------
**# For finding activity level and calories burnt and also clean the data**--
Cleaning the data for with the value zero and only analysis the values with non-zero summation of all three columns activity level and calories burnt


**CODE**


    Select *

    from daily_activity

    Where VeryActiveDistance+ModeratelyActiveDistance+LightActiveDistance != 0 

    And VeryActiveMinutes+FairlyActiveMinutes+LightlyActiveMinutes != 0

    Order BY TotalSteps Desc;


-----------------------------------------------------------------------------------------------------------------------------

**# For finding activity level and calories burnt---**

**CODE**


    SELECT Id, ActivityDate,Calories, TotalSteps,

    TotalDistance, 
 
    (VeryActiveDistance+ModeratelyActiveDistance+LightActiveDistance) AS Total_Active_Distance,
 
    SedentaryActiveDistance, 
 
    (VeryActiveMinutes+FairlyActiveMinutes+LightlyActiveMinutes) AS Total_Active_Minutes,
 
    SedentaryMinutes
 
    FROM daily_activity

    ORDER BY  Total_Active_Distance DESC;


----------------------------------------------------------------------------------------------------------------------------



**# Calcuate Time Spent On Activity Per Day**

**CODE**

    SELECT Distinct Id, SUM(SedentaryMinutes) as sedentary_minutes,

    SUM(LightlyActiveMinutes) as lightly_active_minutes,

    SUM(FairlyActiveMinutes) as fairly_active_minutes, 

    SUM(VeryActiveMinutes) as very_active_minutes

    FROM daily_activity

    GROUP BY Id;

----------------------------------------------------------------------------------------------------------------------------

**# Calculation Of Most Active Weekday (On Average)**

**CODE**

    use fitband;

    SET SQL_SAFE_UPDATES = 0;

     In MySQL, the SQL_SAFE_UPDATES mode can be disabled by setting it back to 1.

	 It's important to note that setting SQL_SAFE_UPDATES to 0.can potentially lead to unintended updates and deletions, so use it       with caution
        
    Update daily_activity

    Set ActivityDate = STR_TO_DATE(ActivityDate, '%m/%d/%Y %h:%i'); 

----------------------------------------------------------------------------------------------------------------------------

**# Add day_0f_week column on daily_activities**

**CODE**

    use fitband;

    Alter Table daily_activity

    ADD day_of_week char(20)


----------------------------------------------------------------------------------------------------------------------------

**# To Extract Day Of Week From Date **

**CODE**

    UPDATE daily_activity

    SET Day_of_Week = dayname(ActivityDate);

----------------------------------------------------------------------------------------------------------------------------


**# to calculate average of total steps, total distance, calories**

we are calculating the average of total steps, total distance, calories from the table grouping by day of week.

**CODE**

    Select AVG(TotalSteps) as avg_steps,
    
    AVG(TotalDistance) as avg_distance,
   
    AVG(Calories) as avg_calories,
   
    Day_of_Week
   
    From daily_activity
   
    Group By  Day_of_Week;

----------------------------------------------------------------------------------------------------------------------------

**# To reverse the setting, you can use the following command:**

**CODE**
  
    SET SQL_SAFE_UPDATES = 1;

----------------------------------------------------------------------------------------------------------------------------


**# updating the string to date**

we are taking the date from string formating the date from sleep_day table

**CODE**
   
    SET SQL_SAFE_UPDATES = 0;

    use fitband;

    Update sleep_day

    Set SleepDay = STR_TO_DATE(SleepDay, '%m/%d/%Y %h:%i:%s %p');

----------------------------------------------------------------------------------------------------------------------------


**# to adding column to add week of the day**

Data Manipukation and transformation-- adding a new column day of week.

**CODE**

     Alter Table sleep_day

     ADD day_of_week varchar(20);

----------------------------------------------------------------------------------------------------------------------------

**# to extract the day of the week**

To extract the day name of the date from sleepday from the sleep_day table

**CODE**

    UPDATE sleep_day
   
    SET Day_of_Week = dayname(SleepDay);

----------------------------------------------------------------------------------------------------------------------------

**# extracting the data**

We are extracting week of the day or dayname and rounding of the average of Total Minutes Asleep from table and groupin by day.

**CODE**

    Select day_of_week,round(avg(TotalMinutesAsleep), 0) AS Avg_Sleep
   
    FROM sleep_day
   
    Group By day_of_week;

----------------------------------------------------------------------------------------------------------------------------
