library(ggpubr)
library(tidyverse)
library(car)

diabetes <- read.csv("diabetes.csv")

# T Test
Yes_diabetes <- filter(diabetes, diabetes$Outcome == 1) 
No_diabetes <- filter(diabetes, diabetes$Outcome == 0)

BMI_diabetes <- Yes_diabetes$BMI
BMI_no_diabetes <- No_diabetes$BMI

qqPlot(BMI_diabetes)
qqPlot(BMI_no_diabetes)
hist(BMI_diabetes)
hist(BMI_no_diabetes)

boxplot(BMI_diabetes, BMI_no_diabetes, names=c("BMI w Diabetes","BMI w/n Diabetes")) 

shapiro.test(BMI_diabetes)      
shapiro.test(BMI_no_diabetes)

t.test(BMI_diabetes,BMI_no_diabetes, paired = FALSE)

# Chi Squared Test
diabetes_Age <- cut(diabetes$Age, 3, labels = c("Young","Middle Age","Old"))
Outcome_Age_table <- table(diabetes$Outcome,diabetes_Age)
Outcome_Age_table
chisq.test(Outcome_Age_table)

# ANOVA
diabetes$Pregnancies <- as.factor(diabetes$Pregnancies)
diabetes$Outcome <- as.factor(diabetes$Outcome)

Diabetes_add <- aov(diabetes$BMI~ diabetes$Outcome + diabetes$Pregnancies)
summary(Diabetes_add)
res_add <- residuals(Diabetes_add)
hist(res_add, main="Histogram for additive model", xlab ="residuals" )
qqPlot(res_add, main = "Q-Q plot for residuals additive")

Diabetes_int <- aov(diabetes$BMI ~ diabetes$Outcome * diabetes$Pregnancies)
summary(Diabetes_int)
res_int <- residuals(Diabetes_int)
hist(res_int, main="Histogram for interaction model", xlab ="residuals")
qqPlot(res_int, main = "Q-Q plot for residuals interaction")

boxplot(BMI ~ Outcome * Pregnancies,
        data = diabetes,
        las = 2,
        main = "BMI by Outcome and Pregnancies",
        ylab = "BMI")


TukeyHSD(Diabetes_add)
TukeyHSD(Diabetes_int)

# Linear Regression
LM_Diabetes <- lm(diabetes$BloodPressure ~ diabetes$Glucose)
qqPlot(diabetes$BloodPressure)
hist(diabetes$BloodPressure)
qqPlot(diabetes$Glucose)
hist(diabetes$Glucose)
summary(LM_Diabetes)

# Pearson Correlation 
cor.test(diabetes$BMI, diabetes$SkinThickness)

scatter.smooth(diabetes$BMI, diabetes$SkinThickness)
plot(diabetes$BMI, diabetes$SkinThickness,
     main = "Scatterplot of Skin Thickness vs BMI",
     xlab = "BMI",
     ylab = "Skin Thickness",
     pch = 19, col = "steelblue")

