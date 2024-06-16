# :chart_with_upwards_trend: Google_Capstone_Project :chart_with_upwards_trend:
This is capstone project for analaysis the data from company to analyze and conclude the result in order to data driven decision. 
Bellabeat data analysis case study . In this case study, I will perform many real-world tasks of a junior data analyst. In this secanrio I am  working for Bellabeat, a high-tech manufacturer of health-focused products for women, and meet different characters and team members. In order to answer the key business questions, you will follow the steps of the data analysis process: ask, prepare, process, analyze, share, and act. 

# :paperclip: Tools
--> **SQL**(Data Exploration,Data Manipualtion)


--> **EXCEL**(Data Visualization)


# :paperclip: Business Questions:

1) Finding numbers of users in Bella beat using different datasets ?
2) To find the relationship calories and total steps ?
3) To find and analyze relation between total step and sedentary minutes ?
4) Examine the active and sedentary minutes inn daliy part of life of users ?
5) Calculation of the most active week day on average ?
6) Find the realtion between average sleep on weekdays?

# :paperclip: Dataset Information:-
In this phase, I viewed all **18 files and decided to use 6 of the 18 files from datasets** that are available to help with my analysis. The datasets chosen will be the following:

• dailyActivity_merged.csv

• dailyCalories_merged.csv

• dailyIntensities_merged.csv 

• dailySteps_merged.csv

• weightLogInfo_merged.csv

I applied a dual approach, leveraging both Excel and SQL, to perform comprehensive data analysis. Each table, seamlessly imported from the original dataset, bore nomenclature consistent with its counterpart in the source dataset. In the cleaning phase, I adeptly employed both Excel and SQL to refine data types, meticulously configuring datetime fields to exclusively house date information or be tailored specifically to capture time (or activity hours).


# :paperclip: SQL Code(Data Manipualtion and Analysis)


:paperclip:  Count Number Of Unquie User In FitBand According To Following Activities--


I have use a distinct command with count to known if there are unique values are there in each column.


:paperclip:CODE**


    use fitband;

    SELECT Count(distinct ID)  FROM daily_activity;

    SELECT Count(distinct ID)  FROM daily_calories;

    SELECT Count(distinct ID)  FROM daily_intensities;

    SELECT Count(distinct ID)  FROM daily_steps;

    SELECT Count(distinct ID)  FROM sleep_day;

    SELECT Count(distinct ID)  FROM weight_log;

    SELECT Count(distinct ID)  FROM heart_rate;

**🔑 OUTPUT-**

![Screen Shot 2024-04-11 at 11 29 11 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/f932480e-99fa-452c-89bf-eec88b5da883)


The analysis highlights a noticeable trend: daily activity, daily calories, daily intensities, and daily steps gain more user attention, whereas daily steps, sleep data, and weight log information have fewer users engaged.

# :key: Recommendation:
In response to user preferences, it is recommended to focus product efforts on refining and expanding features related to daily activities, calorie tracking, intensity monitoring, and step counts. Strengthening these aspects could lead to increased sales and heightened user satisfaction.

----------------------------------------------------------------------------------------------------------------------
**# For finding activity level and calories burnt and also clean the data**--
Cleaning the data for with the value zero and only analysis the values with non-zero summation of all three columns activity level and calories burnt


**:paperclip:CODE** 


    Select *

    from daily_activity

    Where VeryActiveDistance+ModeratelyActiveDistance+LightActiveDistance != 0 

    And VeryActiveMinutes+FairlyActiveMinutes+LightlyActiveMinutes != 0

    Order BY TotalSteps Desc;

**🔑 OUTPUT--**

![Screen Shot 2024-04-11 at 11 30 35 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/8a8c0559-f0ea-4f59-98c7-c33848792c41)

In the provided SQL code, data for the least active members are cleaned by removing entries of individuals with columns such as Very Active Distance, Moderately Active Distance, Light Active Distance, Very Active Minutes, Fairly Active Minutes, and Lightly Active Minutes having values of zero.Taking the dataset into excel for further data visualization and forming scatter chart from the dataset.

**🔑 GRAPH-**

![Screen Shot 2024-04-11 at 11 30 51 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/4f8db0af-d668-471c-9e4e-e14352e135fd)

**Recommendation:**
To engage with users whose calorie intake is higher, suggestions for active and calorie-burning activities can be made. Additionally, providing users with information on adjusting their calorie intake according to their fitness goals can contribute to their overall health and well-being

-----------------------------------------------------------------------------------------------------------------------------

**# For finding activity level and calories burnt---**

**:paperclip:CODE**


    SELECT Id, ActivityDate,Calories, TotalSteps,

    TotalDistance, 
 
    (VeryActiveDistance+ModeratelyActiveDistance+LightActiveDistance) AS Total_Active_Distance,
 
    SedentaryActiveDistance, 
 
    (VeryActiveMinutes+FairlyActiveMinutes+LightlyActiveMinutes) AS Total_Active_Minutes,
 
    SedentaryMinutes
 
    FROM daily_activity

    ORDER BY  Total_Active_Distance DESC;

**🔑 OUTPUT--**

![Screen Shot 2024-04-11 at 11 31 29 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/20de7713-8065-48d2-96e4-06f24e8b4577)

To derive insights, we aggregated data on the least active and less sedentary minutes, combining them with sedentary minutes for a direct comparison with total steps. Our analysis reveals a negative relationship: an increase in sedentary minutes corresponds to a decrease in total steps (active minutes). This correlation is visually represented by a downward-trending line, underscoring the consistent decline in total steps as sedentary minutes rise.

**🔑 GRAPH-**

![Screen Shot 2024-04-11 at 11 31 54 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/54d1723e-5cd8-4fc2-9613-3acaf2e25bfa)

**Recommendation:**

User should be notified for Taking Regular Breaks while siting for that send notification and reminders, recommendation for active hobbies ,suggest walking ,reduce screen time and use practice Desk Exercises and standing desk.

----------------------------------------------------------------------------------------------------------------------------



**# Calcuate Time Spent On Activity Per Day**

**:paperclip:CODE**

    SELECT Distinct Id, SUM(SedentaryMinutes) as sedentary_minutes,

    SUM(LightlyActiveMinutes) as lightly_active_minutes,

    SUM(FairlyActiveMinutes) as fairly_active_minutes, 

    SUM(VeryActiveMinutes) as very_active_minutes

    FROM daily_activity

    GROUP BY Id;

**🔑 OUTPUT--**

![Screen Shot 2024-04-11 at 11 32 18 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/e0d77511-8b39-4f21-9f4e-6151e71f00d1)

**🔑 GRAPH--**

![Screen Shot 2024-04-11 at 11 32 31 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/b0139f4a-b3c9-4d4a-ab72-39b27f49741a)


As seen here, the majority of users using the Bellabeat product spend more time in sedentary minutes than in the combined durations of lightly active, fairly active, and very active minutes. This insight serves as a significant eye- opener, revealing that a substantial portion of the user base tends to have more inactive time than active time, which may impact their overall health.

----------------------------------------------------------------------------------------------------------------------------

**# Calculation Of Most Active Weekday (On Average)**

**:paperclip:CODE**

    use fitband;

    SET SQL_SAFE_UPDATES = 0;

     In MySQL, the SQL_SAFE_UPDATES mode can be disabled by setting it back to 1.

	 It's important to note that setting SQL_SAFE_UPDATES to 0.can potentially lead to unintended updates and deletions, so use it       with caution
        
    Update daily_activity

    Set ActivityDate = STR_TO_DATE(ActivityDate, '%m/%d/%Y %h:%i'); 

----------------------------------------------------------------------------------------------------------------------------

**# Add day_0f_week column on daily_activities**

**:paperclip:CODE**

    use fitband;

    Alter Table daily_activity

    ADD day_of_week char(20)


----------------------------------------------------------------------------------------------------------------------------

**# To Extract Day Of Week From Date **

**:paperclip:CODE**

    UPDATE daily_activity

    SET Day_of_Week = dayname(ActivityDate);

----------------------------------------------------------------------------------------------------------------------------


**# to calculate average of total steps, total distance, calories**

we are calculating the average of total steps, total distance, calories from the table grouping by day of week.

**:paperclip: CODE**

    Select AVG(TotalSteps) as avg_steps,
    
    AVG(TotalDistance) as avg_distance,
   
    AVG(Calories) as avg_calories,
   
    Day_of_Week
   
    From daily_activity
   
    Group By  Day_of_Week;

**🔑 OUTPUT--**

![Screen Shot 2024-04-11 at 11 32 41 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/0c113efd-40d5-4e67-8abf-5f301de86e5e)

This is imported in Excel and line chart is obtain for observation.
After examining the data, a noticeable pattern emerges regarding the average total steps, total distance, and calories. The line chart indicates that Saturday and Tuesday, with Monday in close succession, are the days when people are most active. Conversely, Sunday and Monday appears to be the least favored day for exercise or physical activity.

![Screen Shot 2024-04-11 at 11 34 04 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/927341d5-818f-485d-a3ce-85f283d756bf)

![Screen Shot 2024-04-11 at 11 34 16 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/9344f954-99e1-4e37-b89e-55a748e4d5cf)

![Screen Shot 2024-04-11 at 11 34 24 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/4cbd01df-f81e-4b9e-ae4c-f71a1210954b)

# 🔑 Recommendation:**
To boost activity on less active days, consider increasing notifications to motivate users. Furthermore, on days with higher activity levels, introducing notifications related to nutritious eating habits and reminders for adequate hydration could be valuable additional features.

----------------------------------------------------------------------------------------------------------------------------

**# To reverse the setting, you can use the following command:**

**:paperclip: CODE**
  
    SET SQL_SAFE_UPDATES = 1;

----------------------------------------------------------------------------------------------------------------------------


**# updating the string to date**

we are taking the date from string formating the date from sleep_day table

**:paperclip:CODE**
   
    SET SQL_SAFE_UPDATES = 0;

    use fitband;

    Update sleep_day

    Set SleepDay = STR_TO_DATE(SleepDay, '%m/%d/%Y %h:%i:%s %p');

----------------------------------------------------------------------------------------------------------------------------


**# to adding column to add week of the day**

Data Manipukation and transformation-- adding a new column day of week.

**:paperclip:CODE**

     Alter Table sleep_day

     ADD day_of_week varchar(20);

----------------------------------------------------------------------------------------------------------------------------

**# to extract the day of the week**

To extract the day name of the date from sleepday from the sleep_day table

**:paperclip: CODE**

    UPDATE sleep_day
   
    SET Day_of_Week = dayname(SleepDay);

----------------------------------------------------------------------------------------------------------------------------

**:paperclip:extracting the data**

We are extracting week of the day or dayname and rounding of the average of Total Minutes Asleep from table and groupin by day.

**:paperclip:CODE**

    Select day_of_week,round(avg(TotalMinutesAsleep), 0) AS Avg_Sleep
   
    FROM sleep_day
   
    Group By day_of_week;

**🔑 OUTPUT--**

![Screen Shot 2024-04-11 at 11 34 34 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/73ad309e-0f56-4c13-ad24-45312dd7cfc2)

**🔑 GRAPH**

![Screen Shot 2024-04-11 at 11 34 42 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/3d4a029d-569a-4fd9-8bd7-e53e8d0c90b8)

**🔑 Recommendation:**

After analyzing the data, it's evident that Sunday, Thursday, and Monday emerge as the least active days of the week. This trend translates to increased sedentary time and decreased active time, potentially hindering individuals from reaching their set fitness goals in a timely manner. Addressing strategies to boost activity on these specific days may contribute significantly to overall goal achievement.

----------------------------------------------------------------------------------------------------------------------------

# 🔑 Trends Identified:

1)Low Activity on Sundays:

2)Users walk the least on Sundays.

3)Sleep-Activity Correlation:

4)There is a potential correlation between sleep quality and daily activity levels.

# 🔑 Application to Bellabeat Customers:

1) Sunday Activity Targeting: Encourage Bellabeat users to boost their activity on Sundays through targeted reminders and incentives.Provide personalized challenges or rewards to motivate increased step count on Sundays.

2) Sleep Enhancement Features:Enhance sleep tracking features to highlight the connection between sleep quality and daily activity.Educate users on the benefits of being more active during the day for improved sleep.

# 🔑 Influence on Bellabeat Marketing Strategy:

1)Sunday-Specific Campaigns:Develop marketing campaigns that specifically target Sundays, emphasizing the importance of staying active on this day.Utilize social media, in-app notifications, and email campaigns to deliver these messages.

2)Integrated Sleep-Activity Messaging:Incorporate messages and content within the app that link daily activity with better sleep.Collaborate with sleep experts or influencers to create engaging content that highlights the benefits.

3)Promotion of Personalized Challenges: Introduce and promote personalized challenges that align with identified trends.Showcase success stories or testimonials related to improved activity levels on Sundays and enhanced sleep.



# 🔑 (Suggestion for marketing team)

1) Promote Physical Activity on Inactive Days:-Encourage higher levels of physical activity, especially on less active days such as Sundays.
 
2)Highlight the Link Between Physical Activity and Improved Sleep:-Increase awareness about the positive correlation between regular physical activity and enhanced sleep    quality.

3) Adding new features :-Bellabeat has the opportunity to amplify its sleep tracking feature by emphasizing the correlation between sleep quality and daily activity levels.

   
4) This enhancement can serve as a compelling incentive for individuals to invest in Bellabeat products, promoting the establishment of healthier sleep habits through increased everyday physical activity.

5) Adding minimum workout/calories burn goals:-As users tend to walk the fewest steps on Sundays, a strategic approach would be to target them with an increased number of reminders encouraging a minimum of 8000 steps on this particular day. The company can further enhance user engagement by creating posts and videos within the app, emphasizing the significance of daily walking and the positive impact it has on overall well-being.

