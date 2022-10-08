# MechaCar_Statistical_Analysis

## Overview

Jerremy is assigned a project: AutosRUs’ newest prototype, the MechaCar, is suffering from production troubles that are blocking the manufacturing team’s progress.the goal of this analysos is to provide insight to Autos R us on what may be causing trouble.  


###### *Deliverable 1* 
## Linear Regression to Predict MPG

Linear Regresssion Output: The linear model in **Fig #1** predicts the mpg of the car models listed in the Mercharcar data set provided. Several variables are used in this lm function  determin the mpg, these included  vehice lenght, weight, ground clearance AWD and poiler angle.   

![image](https://user-images.githubusercontent.com/104601282/194696410-ce8261b0-04a6-43bb-b4d8-6df73f68ee08.png)

1. Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?In the statistical summary output **Fig # 2**, each Pr(>|t|) value represents the probability that each coefficient contributes a random amount of variance to the linear model. The data clearly shows that the vehicle weight, the AWD and the spolier angle are statistically unlikely to provide random amounts of variance 
  - Vehicle weight 
  - Spoiler Angle
  - AWD

3. Is the slope of the linear model considered to be zero? Why or why not? The P.value is 5.35e-11 statistically significant, the slope is not considered to be zero.


5. Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?
  Answer: Yes there is only a small difference between the r-squared and adjusted r-squared value 0.7449 vs 0.6825 the difference is negible. 

![image](https://user-images.githubusercontent.com/104601282/194696299-f8b3e05d-95a9-4366-b2fa-7bc53a2bdb1e.png)


###### *Deliverable 2* 

## Summary Statistics on Suspension Coils

The coil suspension data was imported as a table as follows: mecha_coil <- read.csv('Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 

Summary tables were created by chainig. 
total_summary <- mecha_coil %>% summarize(Mean_PSI=mean(PSI),
                                          Median_PSI=median(PSI),
                                          Var_PSI=var(PSI),
                                          Std_Dev_PSI=sd(PSI),
                                          Num_Coil=n(), .groups = 'keep') 
                                          
                                          #4. Lot Summary                                                                
lot_summary <- mecha_coil  %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),
                                                                         Median_PSI=median(PSI),
                                                                         Var_PSI=var(PSI),
                                                                         Std_Dev_PSI=sd(PSI),
                                                                         Num_Coil=n(), .groups = 'keep')
                                                                         
                                          
Total summary table illustrated in **Fig #3**
![image](https://user-images.githubusercontent.com/104601282/194698003-78daf668-1c52-4036-8b1b-99215c45c5c8.png)

Lot Summary illustrated in **Fig #4**

![image](https://user-images.githubusercontent.com/104601282/194698070-974197d6-3ad2-4008-9273-99d264c64702.png)

Upon review of the illusrated data in **Fig #4**  Lots 1 and 2 meet specifications, Lot 3 curently exceeds the set standard for Var_PSI by 70.28%. 


###### *Deliverable 3* 

## T-Tests on Suspension Coils

The script for the individual t.tests are: 

    - t.test(lot1$PSI,mu=1500)
    - t.test(lot2$PSI,mu=1500)
    - t.test(lot3$PSI,mu=1500)
results illustrated in **Fig #5** : 

![image](https://user-images.githubusercontent.com/104601282/194699182-73070f8a-236e-40cd-af84-793af9cb4597.png)


The sript for the lots combined: 
    - t.test(mecha_coil$PSI,mu=1500)
    
    results illustrated in **Fig #6**:
    
![image](https://user-images.githubusercontent.com/104601282/194699326-b7950c02-6f5c-466e-bbca-f85c7e960ba4.png)

###### *Deliverable 4*

## Study Design: MechaCar vs Competition

This study is designed to compare performance of MechaCar vehicles to other maufacturers. In order to acomplish this we reviewed the data as a whole ad then created subdivisions to focus on specific metrics.

The Hypothesis: 

 - The Null (Ho) - Vehicles manfactured by MerChar deliver the same MPG than the competitors. 
 - The Alternatve (Ha) - Competitors provide better MPG for their vehicles 

Performance whise MerchaCar mpg are comparable to other manfacturers.To compare vehicles we reviewed MerChar data that provided vehicle lenght, weight, ground clearance, spoiler angle and mpg. We also reviewed the Mecha_ Coil data that provided the other manufacturers lot number, vehicle ID and PSI. 

It was noted that ground clearance and vehice lenght may influence vehicles mpg. Vehicles should be compared by specific vehicle type for more accurate results. To
The review it was identified that vehicles in lot 3 did not meet the set standard for Var_PSI. 
See Illustration bellow: 

![image](https://user-images.githubusercontent.com/104601282/194701038-0ade2a88-9d1e-47cf-92a7-f27e22148db2.png)

 

