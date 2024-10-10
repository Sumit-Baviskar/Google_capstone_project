# :chart_with_upwards_trend: **Bellabeat Project (Google Capstone Project)** :chart_with_upwards_trend:

# :paperclip: **Introduction :** 
Bellabeat is a high-tech company that manufactures health-focused smart devices aimed at empowering women to take control of their health and wellness. The company offers a range of products, such as the Leaf wellness tracker, smart water bottles, and a subscription-based app that provides personalized health insights. With the increasing demand for wearable technology and data-driven wellness solutions, Bellabeat is strategically positioned to expand its market share.


This project involves analyzing smart device usage data to uncover insights into user behavior, trends, and health habits. By leveraging this data, Bellabeat can better understand how its products are used, refine its marketing strategies, and improve its product offerings. The goal of this analysis is to provide actionable insights that will help Bellabeat optimize its growth and customer engagement in the competitive wellness industry.



# :paperclip: **Purpose :**
The purpose of this Bellabeat Google Capstone project is to analyze user data from Bellabeat's smart wellness devices and provide actionable insights to help the company enhance its products, improve customer engagement, and develop data-driven marketing strategies. By understanding user behavior, such as activity, sleep, and hydration patterns, Bellabeat can make informed decisions to optimize their product offerings and better meet the needs of their target audience. The ultimate goal is to support Bellabeat’s growth in the competitive wellness tech industry by leveraging data analysis to drive innovation and improve user experience.

This is capstone project for analaysis the data from company to analyze and conclude the result in order to data driven decision. 
Bellabeat data analysis case study . In this case study, I will perform many real-world tasks of a junior data analyst. In this secanrio I am  working for Bellabeat, a high-tech manufacturer of health-focused products for women, and meet different characters and team members. In order to answer the key business questions, you will follow the steps of the data analysis process: ask, prepare, process, analyze, share, and act. 


# :paperclip: **Tools :**

-  **SQL (Data Exploration, Data Manipualtion)**

-  **EXCEL (Data Visualization)**


# :paperclip: Business Questions:


**1) Finding numbers of users in Bella beat using different datasets ?**


**2) To find the relationship calories and total steps ?**


**3) To find and analyze relation between total step and sedentary minutes ?**


**4) Examine the active and sedentary minutes inn daliy part of life of users ?**


**5) Calculation of the most active week day on average ?**


**6) Find the realtion between average sleep on weekdays?**



# :paperclip: **Dataset Information :**

In this phase, I viewed all **18 files and decided to use 6 of the 18 files from datasets** that are available to help with my analysis. The datasets chosen will be the following:

 - **dailyActivity_merged.csv**

 - **dailyCalories_merged.csv**

 - **dailyIntensities_merged.csv**

 - **dailySteps_merged.csv**

 - **weightLogInfo_merged.csv**

I applied a dual approach, leveraging both Excel and SQL, to perform comprehensive data analysis. Each table, seamlessly imported from the original dataset, bore nomenclature consistent with its counterpart in the source dataset. In the cleaning phase, I adeptly employed both Excel and SQL to refine data types, meticulously configuring datetime fields to exclusively house date information or be tailored specifically to capture time (or activity hours).


# :paperclip: **Data Manipualtion and Analysis :** 


###  **1) Finding numbers of users in Bella beat using different datasets ?**


I have use a distinct command with count to known if there are unique values are there in each column.


:paperclip: **CODE**


    use fitband;

    SELECT Count(distinct ID)  FROM daily_activity;

    SELECT Count(distinct ID)  FROM daily_calories;

    SELECT Count(distinct ID)  FROM daily_intensities;

    SELECT Count(distinct ID)  FROM daily_steps;

    SELECT Count(distinct ID)  FROM sleep_day;

    SELECT Count(distinct ID)  FROM weight_log;

    SELECT Count(distinct ID)  FROM heart_rate;

**🔑 OUTPUT :**

![Screen Shot 2024-04-11 at 11 29 11 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/f932480e-99fa-452c-89bf-eec88b5da883)


The analysis highlights a noticeable trend: daily activity, daily calories, daily intensities, and daily steps gain more user attention, whereas daily steps, sleep data, and weight log information have fewer users engaged.

### :key: Recommendation:
In response to user preferences, it is recommended to focus product efforts on refining and expanding features related to daily activities, calorie tracking, intensity monitoring, and step counts. Strengthening these aspects could lead to increased sales and heightened user satisfaction.

----------------------------------------------------------------------------------------------------------------------


### **2) To find the relationship calories and total steps ?**

Cleaning the data for with the value zero and only analysis the values with non-zero summation of all three columns activity level and calories burnt


:paperclip: **CODE** 


    Select *

    from daily_activity

    Where VeryActiveDistance+ModeratelyActiveDistance+LightActiveDistance != 0 

    And VeryActiveMinutes+FairlyActiveMinutes+LightlyActiveMinutes != 0

    Order BY TotalSteps Desc;


 🔑 **OUTPUT :**

![Screen Shot 2024-04-11 at 11 30 35 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/8a8c0559-f0ea-4f59-98c7-c33848792c41)

In the provided SQL code, data for the least active members are cleaned by removing entries of individuals with columns such as Very Active Distance, Moderately Active Distance, Light Active Distance, Very Active Minutes, Fairly Active Minutes, and Lightly Active Minutes having values of zero.Taking the dataset into excel for further data visualization and forming scatter chart from the dataset.

🔑 **GRAPH :**

![Screen Shot 2024-04-11 at 11 30 51 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/4f8db0af-d668-471c-9e4e-e14352e135fd)


🔑 **Recommendation :**

To engage with users whose calorie intake is higher, suggestions for active and calorie-burning activities can be made. Additionally, providing users with information on adjusting their calorie intake according to their fitness goals can contribute to their overall health and well-being

-----------------------------------------------------------------------------------------------------------------------------


### **3) To find and analyze relation between total step and sedentary minutes ?**

:paperclip: **CODE**


    SELECT Id, ActivityDate,Calories, TotalSteps,

    TotalDistance, 
 
    (VeryActiveDistance+ModeratelyActiveDistance+LightActiveDistance) AS Total_Active_Distance,
 
    SedentaryActiveDistance, 
 
    (VeryActiveMinutes+FairlyActiveMinutes+LightlyActiveMinutes) AS Total_Active_Minutes,
 
    SedentaryMinutes
 
    FROM daily_activity

    ORDER BY  Total_Active_Distance DESC;


🔑 **OUTPUT :**


![Screen Shot 2024-04-11 at 11 31 29 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/20de7713-8065-48d2-96e4-06f24e8b4577)


To derive insights, we aggregated data on the least active and less sedentary minutes, combining them with sedentary minutes for a direct comparison with total steps. Our analysis reveals a negative relationship: an increase in sedentary minutes corresponds to a decrease in total steps (active minutes). This correlation is visually represented by a downward-trending line, underscoring the consistent decline in total steps as sedentary minutes rise.

🔑 **GRAPH :**

![Screen Shot 2024-04-11 at 11 31 54 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/54d1723e-5cd8-4fc2-9613-3acaf2e25bfa)


🔑 **Recommendation :**

User should be notified for Taking Regular Breaks while siting for that send notification and reminders, recommendation for active hobbies ,suggest walking ,reduce screen time and use practice Desk Exercises and standing desk.

----------------------------------------------------------------------------------------------------------------------------


### **4) Examine the active and sedentary minutes inn daliy part of life of users ?**

:paperclip: **CODE**

    SELECT Distinct Id, SUM(SedentaryMinutes) as sedentary_minutes,

    SUM(LightlyActiveMinutes) as lightly_active_minutes,

    SUM(FairlyActiveMinutes) as fairly_active_minutes, 

    SUM(VeryActiveMinutes) as very_active_minutes

    FROM daily_activity

    GROUP BY Id;


🔑 **OUTPUT :**

![Screen Shot 2024-04-11 at 11 32 18 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/e0d77511-8b39-4f21-9f4e-6151e71f00d1)

🔑 **GRAPH :**


![Screen Shot 2024-04-11 at 11 32 31 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/b0139f4a-b3c9-4d4a-ab72-39b27f49741a)


As seen here, the majority of users using the Bellabeat product spend more time in sedentary minutes than in the combined durations of lightly active, fairly active, and very active minutes. This insight serves as a significant eye- opener, revealing that a substantial portion of the user base tends to have more inactive time than active time, which may impact their overall health.

----------------------------------------------------------------------------------------------------------------------------


**5) Calculation of the most active week day on average ?**


:paperclip: **CODE**

    use fitband;

    SET SQL_SAFE_UPDATES = 0;

     In MySQL, the SQL_SAFE_UPDATES mode can be disabled by setting it back to 1.

	 It's important to note that setting SQL_SAFE_UPDATES to 0.can potentially lead to unintended updates and deletions, so use it       with caution
        
    Update daily_activity

    Set ActivityDate = STR_TO_DATE(ActivityDate, '%m/%d/%Y %h:%i'); 


### **Add day of week column on daily_activities**

 :paperclip: **CODE**

    use fitband;

    Alter Table daily_activity

    ADD day_of_week char(20)



### **To Extract Day Of Week From Date**

:paperclip: **CODE**

    UPDATE daily_activity

    SET Day_of_Week = dayname(ActivityDate);



### **to calculate average of total steps, total distance, calories**

we are calculating the average of total steps, total distance, calories from the table grouping by day of week.

:paperclip: **CODE**

    Select AVG(TotalSteps) as avg_steps,
    
    AVG(TotalDistance) as avg_distance,
   
    AVG(Calories) as avg_calories,
   
    Day_of_Week
   
    From daily_activity
   
    Group By  Day_of_Week;

🔑 **OUTPUT :**

![Screen Shot 2024-04-11 at 11 32 41 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/0c113efd-40d5-4e67-8abf-5f301de86e5e)

This is imported in Excel and line chart is obtain for observation.
After examining the data, a noticeable pattern emerges regarding the average total steps, total distance, and calories. The line chart indicates that Saturday and Tuesday, with Monday in close succession, are the days when people are most active. Conversely, Sunday and Monday appears to be the least favored day for exercise or physical activity.

![Screen Shot 2024-04-11 at 11 34 04 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/927341d5-818f-485d-a3ce-85f283d756bf)

![Screen Shot 2024-04-11 at 11 34 16 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/9344f954-99e1-4e37-b89e-55a748e4d5cf)

![Screen Shot 2024-04-11 at 11 34 24 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/4cbd01df-f81e-4b9e-ae4c-f71a1210954b)

🔑 **Recommendation :**

To boost activity on less active days, consider increasing notifications to motivate users. Furthermore, on days with higher activity levels, introducing notifications related to nutritious eating habits and reminders for adequate hydration could be valuable additional features.

----------------------------------------------------------------------------------------------------------------------------

### **6) Find the realtion between average sleep on weekdays ?**

:paperclip: **CODE**
  
    SET SQL_SAFE_UPDATES = 1;




### **updating the string to date**

we are taking the date from string formating the date from sleep_day table

:paperclip: **CODE**
   
    SET SQL_SAFE_UPDATES = 0;

    use fitband;

    Update sleep_day

    Set SleepDay = STR_TO_DATE(SleepDay, '%m/%d/%Y %h:%i:%s %p');

----------------------------------------------------------------------------------------------------------------------------


### **to adding column to add week of the day**

Data Manipulation and transformation -- adding a new column day of week.

:paperclip: **CODE**

     Alter Table sleep_day

     ADD day_of_week varchar(20);



### **to extract the day of the week**

To extract the day name of the date from sleepday from the sleep_day table

:paperclip: **CODE :**

    UPDATE sleep_day
   
    SET Day_of_Week = dayname(SleepDay);



### :paperclip: **extracting the data**

We are extracting week of the day or dayname and rounding of the average of Total Minutes Asleep from table and groupin by day.

:paperclip: **CODE**

    Select day_of_week,round(avg(TotalMinutesAsleep), 0) AS Avg_Sleep
   
    FROM sleep_day
   
    Group By day_of_week;


🔑 **OUTPUT :**

![Screen Shot 2024-04-11 at 11 34 34 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/73ad309e-0f56-4c13-ad24-45312dd7cfc2)


🔑 **GRAPH :**

![Screen Shot 2024-04-11 at 11 34 42 PM](https://github.com/Sumit-Baviskar/Google_capstone_project/assets/153518735/3d4a029d-569a-4fd9-8bd7-e53e8d0c90b8)

🔑 **Recommendation:**

After analyzing the data, it's evident that Sunday, Thursday, and Monday emerge as the least active days of the week. This trend translates to increased sedentary time and decreased active time, potentially hindering individuals from reaching their set fitness goals in a timely manner. Addressing strategies to boost activity on these specific days may contribute significantly to overall goal achievement.

----------------------------------------------------------------------------------------------------------------------------

# 🔑**Trends Identified :**

The trends revealed in the Bellabeat data provide significant insights into user behavior. Notably, the low activity levels on Sundays present an opportunity for intervention. Many users tend to slow down on Sundays, with step counts reaching their lowest point during the week. This could be due to a combination of rest days, social gatherings, or personal downtime. However, this inactivity can be addressed through targeted strategies that motivate users to remain physically active even on weekends. 


- **1) Low Activity on Sundays :**

   - Users tend to have lower levels of physical activity on Sundays.

- **2) Users walk the least on Sundays :**

  - The data shows that step count is lowest on Sundays, indicating a drop in overall movement.

- **3) Sleep-Activity Correlation :**
  
  - A potential correlation exists between daily activity levels and sleep quality, suggesting that more active users tend to experience better sleep.


Additionally, the potential correlation between daily activity and sleep quality is a crucial finding. Users who are more active during the day tend to experience better, more restful sleep. This insight emphasizes the need for users to maintain a balanced routine, where consistent activity leads to improved overall wellness, including enhanced sleep patterns. Bellabeat can leverage this correlation to provide more personalized health insights, promoting the idea that staying active has benefits beyond just physical fitness—it directly impacts sleep quality, an essential factor in well-being.


# 🔑 **Application to Bellabeat Customers :**

- **Sunday Activity Targeting :**


  - To combat low activity levels on Sundays, Bellabeat can encourage users to increase their activity through targeted reminders and incentives. Personalized challenges, rewards for higher step counts, and Sunday-specific activity goals can motivate users to stay active on what appears to be a slower day.


- **Sleep Enhancement Features :**
  - Bellabeat can enhance its sleep tracking features by emphasizing the link between daily activity and sleep quality. Educating users through the app on the benefits of higher activity levels for better sleep can help users focus on both areas, creating a more holistic health routine. Highlighting this connection in the app’s user interface can encourage users to pay attention to both their sleep and activity metrics.



# 🔑 **Recommendation :**

Based on the data analysis, the following recommendations can be made for Bellabeat’s future growth and product improvement:

- **Enhance User Engagement Features :**

  -  Bellabeat should consider adding more personalized notifications and goal-setting features to keep users motivated. Offering insights into how consistent tracking leads to better health outcomes could improve retention.


- **Focus on Sleep and Activity Tracking :**

  -  Since sleep and activity monitoring are the most popular features, Bellabeat should focus on enhancing these areas by introducing more detailed analytics and improving user experience through simplified data visualization.

    
- **Expand Marketing to Health-Conscious Segments :**

  - Bellabeat should target more health-conscious and wellness-driven demographics through personalized marketing campaigns that emphasize the benefits of consistent use of their devices for long-term health improvement.


- **Integrate with Other Wellness Platforms :**

  -  Offering integration with other health and fitness platforms, such as MyFitnessPal or Apple Health, could create a more holistic experience for users, making Bellabeat devices a central part of their wellness routine.
 
    
These steps will not only enhance customer satisfaction but also help Bellabeat expand its market presence, improve user retention, and attract new customers through a more refined product experience.


# 🔑 **Suggestions for the Marketing Team :**

- **Promote Physical Activity on Inactive Days :**  

  - Encourage higher levels of physical activity, particularly on low-activity days like Sundays. Bellabeat can create personalized reminders, in-app notifications, and social media campaigns to motivate users to stay active on weekends, emphasizing how even light activities can make a significant difference in their health and wellness.

- **Highlight the Link Between Physical Activity and Improved Sleep :**  

  - Increase awareness of the positive correlation between regular physical activity and better sleep quality. By creating targeted content that educates users on how being active throughout the day can improve sleep, Bellabeat can engage customers and reinforce the value of using its devices for a holistic approach to health. Collaborating with sleep experts or influencers to share insights could also strengthen this message.

- **Adding New Features :**  


  - Bellabeat can enhance its sleep tracking feature by incorporating more insights on the relationship between daily activity and sleep quality. Introducing notifications or badges that highlight the benefits of balanced activity levels could encourage users to monitor both aspects more closely. This upgrade would be a powerful selling point for new customers seeking comprehensive wellness tracking.


- **Incentivize Healthy Habits Through Product Promotion :**  


  - This feature upgrade can serve as a compelling incentive for individuals to invest in Bellabeat products, as it promotes healthier sleep habits through increased daily activity. Marketing efforts should focus on how Bellabeat devices can help users establish balanced routines that benefit their overall wellness.


- **Introduce Minimum Workout/Calories Burn Goals :**  

  - To combat low activity on Sundays, Bellabeat could introduce minimum step goals, such as encouraging users to walk at least 8,000 steps on Sundays. The company could further enhance user engagement by creating in-app posts, videos, and challenges that emphasize the importance of daily walking for overall well-being. By framing Sundays as a key day for health rejuvenation, Bellabeat can inspire users to stay active even on rest days.

# 🔑 **Conclusion :**


### **Conclusion :**


The analysis of Bellabeat’s user data offers valuable insights into the behavior and wellness patterns of its customers, presenting opportunities for the company to enhance its product offerings and customer engagement strategies. One of the key findings is the notable decrease in physical activity levels on Sundays, with users walking the least on this day. This trend opens the door for targeted interventions, such as personalized reminders, challenges, and rewards, to motivate users to stay active even on traditionally inactive days. By addressing this behavior, Bellabeat can help users maintain consistent wellness routines throughout the week.


Another significant insight is the potential correlation between daily physical activity and sleep quality. Users who engage in more consistent activity during the day tend to report better sleep, which underscores the importance of a balanced approach to health. This correlation provides Bellabeat with an opportunity to enhance its sleep tracking features and educate users on the benefits of staying active for better sleep. By emphasizing the holistic connection between activity and sleep, Bellabeat can position itself as a leader in personalized wellness technology.


These insights not only pave the way for product improvements but also offer guidance for marketing strategies. Bellabeat can leverage these findings to develop campaigns that focus on increasing user engagement, particularly on Sundays, while also promoting the broader benefits of an active lifestyle. Campaigns that highlight the link between physical activity and improved sleep can be used to attract and retain customers, demonstrating the value of Bellabeat’s products in helping users lead healthier lives.


In summary, Bellabeat is well-positioned to drive greater customer satisfaction and product usage by addressing these trends. By focusing on enhancing user engagement through personalized challenges and features, and by marketing the connections between activity and sleep, Bellabeat can foster deeper connections with its user base, increase product adoption, and continue to grow in the competitive wellness technology market.
