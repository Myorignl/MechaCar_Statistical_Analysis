library(dplyr)
library(tidyverse)
library (knitr) #unsure of this 
library(ggplot2)


#import data as DF- page 15.2.5
mechacar_mpg <- read.csv('mechacar_mpg.csv', check.names = F, stringsAsFactors = F)#import data as DataFrame

#Linear regression 15.7.2
lm(mpg~vehicle_length+ vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechacar_mpg)

#Do the Summary 15.7.2

summary.data.frame(mechacar_mpg)

summary(lm(mpg~vehicle_length+ vehicle_weight + spoiler_angle + ground_clearance + AWD, data = mechacar_mpg))



### CHALLENGE 15: DELIVERABLE 2

#2. Import and read in the Suspension_Coil.csv 
mecha_coil <- read.csv('Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 

#3. Create a total_summary dataFrame  
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


#box plot: PSI visual 
plt2 <- ggplot(mecha_coil,aes(x=Manufacturing_Lot,y=PSI)) 
plt2 + geom_boxplot()

### CHALLENGE 15: DELIVERABLE 3

#Page 15.6.3
#1. t.test() 
t.test(mecha_coil$PSI,mu=1500)



lot1 <- subset(mecha_coil, Manufacturing_Lot=="Lot1")
lot2 <- subset(mecha_coil, Manufacturing_Lot=="Lot2")
lot3 <- subset(mecha_coil, Manufacturing_Lot=="Lot3")

t.test(lot1$PSI,mu=1500)
t.test(lot2$PSI,mu=1500)
t.test(lot3$PSI,mu=1500)