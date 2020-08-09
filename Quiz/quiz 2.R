> read.csv("b1.csv",header=T)
Country Cigarette Coronary
1   United States       3900    259.9
2          Canada       3350    211.6
3       Australia       3220    238.1
4     New Zealand       3220    211.8
5  United Kingdom       2790    194.1
6     Switzerland       2780    124.5
7         Ireland       2770    187.3
8         Iceland       2290    110.5
9         Finland       2160    233.1
10   West Germany       1890    150.3
11    Netherlands       1810    124.7
12         Greece       1800     41.2
13        Austria       1770    182.1
14        Belgium       1700    118.1
15         Mexico       1680     31.9
16          Italy       1510    114.3
17        Denmark       1500    144.9
18         France       1410    144.9
19         Sweden       1270    126.9
20          Spain       1200     43.9
21         Norway       1090    136.3
> data <- read.csv("b1.csv",header=T)
> y <- data$Coronary
> x <- data$Cigarette
> lm(y~x,data)

Call:
  lm(formula = y ~ x, data = data)

Coefficients:
  (Intercept)            x  
29.45259      0.05568  

> summary(lm(y~x,data))

Call:
  lm(formula = y ~ x, data = data)

Residuals:
  Min      1Q  Median      3Q 
-91.101  -6.015   3.603  29.346 
Max 
83.370 

Coefficients:
  Estimate Std. Error
(Intercept) 29.45259   29.48236
x            0.05568    0.01288
t value Pr(>|t|)    
(Intercept)   0.999 0.330353    
x             4.322 0.000368 ***
  ---
  Signif. codes:  
  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05
‘.’ 0.1 ‘ ’ 1

Residual standard error: 46.56 on 19 degrees of freedom
Multiple R-squared:  0.4957,	Adjusted R-squared:  0.4692 
F-statistic: 18.68 on 1 and 19 DF,  p-value: 0.0003676
> cor(y,x)
[1] 0.7040815
> model <- lm(y~x,data)
> fitted(model);
1         2         3 
246.61936 215.99327 208.75438 
4         5         6 
208.75438 184.81035 184.25352 
7         8         9 
183.69668 156.96846 149.72957 
10        11        12 
134.69495 130.24024 129.68341 
13        14        15 
128.01289 124.11503 123.00135 
16        17        18 
113.53511 112.97827 107.96673 
19        20        21 
100.17100  96.27314  90.14792 
> resid(model)
1           2           3 
13.2806450  -4.3932732  29.3456189 
4           5           6 
3.0456189   9.2896465 -59.7535157 
7           8           9 
3.6033222 -46.4684609  83.3704311 
10          11          12 
15.6050531  -5.5402441 -88.4834062 
13          14          15 
54.0871073  -6.0150277 -91.1013520 
16          17          18 
0.7648915  31.9217293  36.9332700 
19          20          21 
26.7289999 -52.3731351  46.1520812 