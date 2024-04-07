-- COUNT Number Of Unquie User In FitBand According To Following Activities

use fitband;
SELECT Count(distinct ID)  FROM daily_activity;
SELECT Count(distinct ID)  FROM daily_calories;
SELECT Count(distinct ID)  FROM daily_intensities;
SELECT Count(distinct ID)  FROM daily_steps;
SELECT Count(distinct ID)  FROM sleep_day;
SELECT Count(distinct ID)  FROM weight_log;
SELECT Count(distinct ID)  FROM heart_rate;



## For finding activity level and calories burnt and also clean the data

Select *
from daily_activity
Where VeryActiveDistance+ModeratelyActiveDistance+LightActiveDistance != 0 
And VeryActiveMinutes+FairlyActiveMinutes+LightlyActiveMinutes != 0
Order BY TotalSteps Desc;




## For finding activity level and calories burnt

SELECT Id, ActivityDate,Calories, TotalSteps,
 TotalDistance, 
 (VeryActiveDistance+ModeratelyActiveDistance+LightActiveDistance) AS Total_Active_Distance,
 SedentaryActiveDistance, 
 (VeryActiveMinutes+FairlyActiveMinutes+LightlyActiveMinutes) AS Total_Active_Minutes,
 SedentaryMinutes
FROM daily_activity
ORDER BY  Total_Active_Distance DESC;






-- Calcuate Time Spent On Activity Per Day
SELECT Distinct Id, SUM(SedentaryMinutes) as sedentary_minutes,
SUM(LightlyActiveMinutes) as lightly_active_minutes,
SUM(FairlyActiveMinutes) as fairly_active_minutes, 
SUM(VeryActiveMinutes) as very_active_minutes
FROM daily_activity
GROUP BY Id;

-- Calculation Of Most Active Weekday (On Average)
use fitband;
SET SQL_SAFE_UPDATES = 0; -- In MySQL, the SQL_SAFE_UPDATES mode can be disabled by setting it back to 1.
						  -- It's important to note that setting SQL_SAFE_UPDATES to 0
						  -- can potentially lead to unintended updates and deletions, so use it with caution
Update daily_activity
Set ActivityDate = STR_TO_DATE(ActivityDate, '%m/%d/%Y %h:%i'); --

-- Add day_0f_week column on daily_activities
use fitband;
Alter Table daily_activity
ADD day_of_week char(20)

-- To Extract Day Of Week From Date 
UPDATE daily_activity
SET Day_of_Week = dayname(ActivityDate);

#to calculate average of total steps, total distance, calories
Select AVG(TotalSteps) as avg_steps,
AVG(TotalDistance) as avg_distance,
AVG(Calories) as avg_calories,
Day_of_Week
From daily_activity
Group By  Day_of_Week;

-- To reverse the setting, you can use the following command:
SET SQL_SAFE_UPDATES = 1;


# updating the string to date
SET SQL_SAFE_UPDATES = 0;
use fitband;
Update sleep_day
Set SleepDay = STR_TO_DATE(SleepDay, '%m/%d/%Y %h:%i:%s %p');

# to adding column to add week of the day
Alter Table sleep_day
ADD day_of_week varchar(20);

# to extract the day of the week
UPDATE sleep_day
SET Day_of_Week = dayname(SleepDay);

#extracting the data
Select day_of_week,round(avg(TotalMinutesAsleep), 0) AS Avg_Sleep FROM
sleep_day
Group By day_of_week;

