#8
#1. not claim goodness of fit -0.5
#2. not claim goodness of fit -0.5
#3. Family may be significant -0.5
#3. Regressor could be random -0.5
setwd("~/Desktop")
install.packages("readxl")
library("readxl") 
data <- read_excel("Galton.xlsx")
df <- as.data.frame(data)
son <- df[ which(df$Gender=='M'), ]
son <- subset(son, select = c("Family", "Father", "Mother", "Kids","Height"))
#Q1
# Fit the full model 
full.model <- lm(son$Height ~Father+Mother+Kids, data = son)
# Stepwise regression model
step.model <- stepAIC(full.model, direction = "both", 
                      trace = FALSE)
summary(step.model)
'''
Call:
  lm(formula = son$Height ~ Father + Mother + Kids, data = son)
Residuals:
  Min      1Q  Median      3Q     Max 
-9.4472 -1.4650  0.1749  1.4896  9.1840 

Coefficients:
  Estimate Std. Error t value Pr(>|t|)    
(Intercept) 20.41215    4.15361   4.914 1.24e-06 ***
  Father       0.40346    0.04674   8.632  < 2e-16 ***
  Mother       0.33402    0.04586   7.284 1.42e-12 ***
  Kids        -0.07856    0.04046  -1.942   0.0528 .  
---
  Signif. codes:  
  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.293 on 461 degrees of freedom
Multiple R-squared:  0.2458,	Adjusted R-squared:  0.2409 
F-statistic: 50.09 on 3 and 461 DF,  p-value: < 2.2e-16
'''
anova(step.model)
'''
Analysis of Variance Table

Response: son$Height
           Df  Sum Sq Mean Sq F value    Pr(>F)    
Father      1  492.06  492.06 93.6048 < 2.2e-16 ***
Mother      1  278.10  278.10 52.9042 1.515e-12 ***
Kids        1   19.82   19.82  3.7704   0.05278 .  
Residuals 461 2423.35    5.26                      
---
Signif. codes:  
0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
'''
par(mfrow=c(2,2))
plot(step.model)
'''
Residuals vs Fitted checkd the linear relationship assumptions.

Normal Q-Q. checked whether the residuals are normally distributed. 

Scale-Location checked the homogeneity of variance of the residuals 

Residuals vs Leverage. identified influential cases
'''
#Q2
contrasts(factor(df$Gender))
'''
M
F 0
M 1
'''
# Fit the full model 
full.model <- lm(df$Height ~Father+Mother+factor(Gender)+Kids, data = df)
# Stepwise regression model
step.model <- stepAIC(full.model, direction = "both", 
                      trace = FALSE)
summary(step.model)
'''
Call:
lm(formula = df$Height ~ Father + Mother + factor(Gender) + Kids, 
    data = df)

Residuals:
    Min      1Q  Median      3Q     Max 
-9.4748 -1.4500  0.0889  1.4716  9.1656 

Coefficients:
                Estimate Std. Error t value
(Intercept)     16.18771    2.79387   5.794
Father           0.39831    0.02957  13.472
Mother           0.32096    0.03126  10.269
factor(Gender)M  5.20995    0.14422  36.125
Kids            -0.04382    0.02718  -1.612
                Pr(>|t|)    
(Intercept)     9.52e-09 ***
Father           < 2e-16 ***
Mother           < 2e-16 ***
factor(Gender)M  < 2e-16 ***
Kids               0.107    
---
Signif. codes:  
0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 2.152 on 893 degrees of freedom
Multiple R-squared:  0.6407,	Adjusted R-squared:  0.6391 
F-statistic: 398.1 on 4 and 893 DF,  p-value: < 2.2e-16

'''

par(mfrow=c(2,2))
plot(step.model)

'''
Residuals vs Fitted checkd the linear relationship assumptions.

Normal Q-Q. checked whether the residuals are normally distributed. 

Scale-Location checked the homogeneity of variance of the residuals 

Residuals vs Leverage. identified influential cases
'''

#q3
'''
In our first and second model, the plot shows 2 extreme points
with a standardized residuals above 2 and 1 outlier that exceeds 3 standard deviations which may be an outlier.
We may want to take those points out and rebuild the model.
