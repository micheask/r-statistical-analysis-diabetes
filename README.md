# r-statistical-analysis-diabetes
Statistical analysis on a diabetes dataset in R. 

# Diabetes Data Analysis in R

## T-Test: BMI vs Diabetes Outcome

> shapiro.test(BMI_diabetes)

- Shapiro-Wilk normality test

data:  BMI_diabetes
W = 0.92826, p-value = 4.31e-10
> shapiro.test(BMI_no_diabetes)

- Shapiro-Wilk normality test

data:  BMI_no_diabetes
W = 0.94315, p-value = 6.528e-13
> t.test(BMI_diabetes,BMI_no_diabetes, paired = FALSE)

- Welch Two Sample t-test

data:  BMI_diabetes and BMI_no_diabetes
t = 8.6193, df = 573.47, p-value
< 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
 3.735811 5.940864
sample estimates:
mean of x mean of y 
 35.14254  30.30420 
 
<img width="800" height="600" alt="plot 1" src="https://github.com/user-attachments/assets/3fe4ece0-6c68-4073-8769-4987fc3a1e8b" />
<img width="800" height="600" alt="bmino" src="https://github.com/user-attachments/assets/98b55c5b-8983-4b20-891c-cff12ba37d1c" />

## Chi-Squared: Age vs Diabetes Outcome

> chisq.test(Outcome_Age_table)

	Pearson's Chi-squared test

data:  Outcome_Age_table
X-squared = 37.604, df = 2,
p-value = 6.829e-09

## ANOVA: BMI by Outcome and Pregnancies
                      Df Sum Sq
diabetes$Outcome       1   4084
diabetes$Pregnancies  16   1662
Residuals            750  41930
                     Mean Sq F value
diabetes$Outcome        4084  73.058
diabetes$Pregnancies     104   1.858
Residuals                 56        
                     Pr(>F)    
diabetes$Outcome     <2e-16 ***
diabetes$Pregnancies 0.0213 *  
Residuals                      
---
Signif. codes:  
  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05
  ‘.’ 0.1 ‘ ’ 1
  
<img width="800" height="600" alt="histogramaddi" src="https://github.com/user-attachments/assets/fc4efd6c-c2fc-405d-975f-a7c49a65d5cd" />
<img width="800" height="600" alt="qqplotresi" src="https://github.com/user-attachments/assets/61dd8f07-bf5b-4c18-b8e6-ff36f1f30386" />
<img width="800" height="600" alt="histogram 12" src="https://github.com/user-attachments/assets/1d1c3056-9f9b-459c-a7eb-fa089af63130" />
<img width="800" height="600" alt="qqplotresint" src="https://github.com/user-attachments/assets/395c953f-eb0f-407c-b7da-cee76aa88675" />


## Linear Regression: Blood Pressure ~ Glucose
Call:
lm(formula = diabetes$BloodPressure ~ diabetes$Glucose)

Residuals:
    Min      1Q  Median      3Q     Max 
-74.843  -5.914   2.333  10.676  55.194 

Coefficients:
                 Estimate Std. Error t value Pr(>|t|)    
(Intercept)      57.93775    2.70316  21.433  < 2e-16 ***
diabetes$Glucose  0.09238    0.02162   4.273 2.17e-05 ***
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 19.14 on 766 degrees of freedom
Multiple R-squared:  0.02328,	Adjusted R-squared:  0.02201 
F-statistic: 18.26 on 1 and 766 DF,  p-value: 2.17e-05

<img width="800" height="600" alt="LR1" src="https://github.com/user-attachments/assets/6655d061-d4c7-4023-9f55-1e2ab8f39478" />
<img width="800" height="600" alt="LR2" src="https://github.com/user-attachments/assets/9b6aa18c-4e66-49a2-801e-6cbcbd25c34f" />
<img width="800" height="800" alt="LR3" src="https://github.com/user-attachments/assets/c481a52d-9c21-4796-9520-194a69bb2f5b" />
<img width="400" height="247" alt="LR4" src="https://github.com/user-attachments/assets/d3a6f4f6-eb4e-45d1-9de8-4cb761b1d4ba" />

## Pearson Correlation: BMI vs Skin Thickness

	Pearson's product-moment correlation

data:  diabetes$BMI and diabetes$SkinThickness
t = 11.814, df = 766, p-value < 2.2e-16
alternative hypothesis: true correlation is not equal to 0
95 percent confidence interval:
 0.3310222 0.4507978
sample estimates:
      cor 
0.3925732
<img width="800" height="600" alt="lastone" src="https://github.com/user-attachments/assets/6b51f7e2-b72d-452b-965c-9e50ae75bb12" />



