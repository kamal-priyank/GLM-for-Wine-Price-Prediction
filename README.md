**Analytics methods of business** 

**Final Individual assignment**

***Part 1:***

***1(a) Justification of the chosen regression model specification:***

`       `The analysis aims to model the response variable price as a function of the other independent variables, which are h.rain,w.rain,s.temp,h.temp and parker. This is done by applying the gamma generalized linear model. 

After applying the model, I chose three predictors for the final model, which gives a regression equation with an R-squared value of 0.84 and an AIC score of 109.76.

log*(price) = 76.22 -0.039\*year+0.128\*s.temp+0.035\*parker* 

A minimal data pre-processing is done, and rows containing empty values are removed using the na.omit() function. 

The linearity of the model is assessed by using the cor() function to check the correlation between the dependent variable price and other independent variables, and the multicollinearity is checked by calculating the variance inflation factor for each independent variable against the dependent variable using the vif() function, which showed that there is no multicollinearity.

***VIF Result:***

|year   |s.temp  |parker  |w.rain  |h.rain  |h.temp|
| :- | :- | :- | :- | :- | :- |
|1.493728 |2.156459|2.214266|1.862054|1.904492|2.402285|
` `The above results show that there is no high multicollinearity, and all the independent variables have moderate multicollinearity as they lie between 2 to 5. If high multicollinearity is present between two variables, then the model makes one of the variables more insignificant.

To select variables for the final model, the gamma generalized linear model is fitted to the preprocessed data using the glm() function and giving in family argument as Gamma (link = “log”), the summary statistics of the runner regression model shows us that three variables out of six have a high P-Value > 0.05, which means they are insignificant.

Backward elimination is done to remove the insignificant variables from the model, the variable with the highest P-Value I.e., w.rain is removed and then the summary statistics are checked again to remove further variables with a high P-value, removing h.rain and then h.temp,Which gives a final model with three significant variables year, s.temp and parker.

|coefficients|Estimate |Std. Error |Error t value|Pr(>|t|)|
| :- | :- | :- | :- | :- |
|intercept|76.228200  |14.581488|5.228|8.29e-05|
|year|-0.039556|0.007535|-5.249|7.94e-05|
|s.temp|0.128617 |0.059147  |2.175|0.045|
|parker|0.035645|0.004700|7.585|1.10e-06|
Also, the residual deviance increases with two degrees of freedom after removing the highly insignificant variables, the R-Squared of the model is 0.84 which is a good fit.

***1(b) model summary & Interpretation:***

`                          `Log(price) = 76.22 -0.039\*year+0.128\*s.temp+0.035\*parker

We can infer from this equation that s.temp is a less significant positive predictor, year being a negative predictor of high significance and parker is a highly significant positive indicator which influences the price.

The summary table of the gamma GLM model fitted to the wine data

The above summary statistics shows us and AIC of 109.76 which is less than what we got initially when all the variables were selected, also the AIC when the canonical link taken as inverse gives us an aic of 106.5 which is even better, but it makes the s.temp variable insignificant, which is why we go with the gamma model with link being log.

The high null deviance of the model allows us to reject the null hypothesis, which means only intercept is not enough to explain the response variable and the low residual deviance value explains that the model is a good fit when the significant variables including the intercept are considered.

With the use of null and residual deviances, we calculate the R-squared value of the model I.e., 0.84, which shows us the goodness of fit of the model.

***Residual Plots:***

From the residual plots shown above we can see that most of the residuals are plotted close to the zero line randomly which means that the predictions are reasonable and do not show any skewness in the plot. The normal Q-Q plot also shows a good alignment of the residuals along the straight line which indicates that they are normally distributed, the scale-location plot shows us that the residuals are equally distributed below and above the line which shows that they have a constant variance. Now looking at the residuals vs leverage plot we can clearly say that there are no residuals outside cook’s distance. 

***1(c) Limitations and Recommendations:***

There are some outliers which lie in the data which makes the data a little skewed, which might the affect result of the regression, these can be remove which will make the regression more efficient and give accurate results but doing this would result in eliminating one more predictor variable, which would leave us with the most obvious predictors.

The relationships of price found with the predictors may not hold true if other factors or additional predictors are considered such as age of the wine etc.

The number of variables being less makes the price depending on only a few predictors, Which might not be the case if there were more predictors and also making the parker into categories and grading it in level ranging from bad to excellent.

***1(d) Improvements and learning from the analysis:***

The major takeaways from the analysis are that only three variables out of six are significant in predicting the price of the Bordeaux wines. However, as I thought that the rain the harvest month(h.rain) and rain in the winter preceding the harvest(w.rain) would have no significance in predicting the price, which turned out to be True from the analysis.

There would be a significant increase in efficiency to predict the price of the wine if more explanatory variables such as age and year of harvest were considered, we could also consider the wine scoring scale of Robert Parker and classify the quality of the wine, these improvements when considered can gradually increase the R-squared value which increases if the number of significant explanatory variables increases. 




***Part 2:***

***2(a)*** The Scatterplot of Mistakes vs Speed shows that there is an outlier which makes the regression skewed which is not that linear and the scatterplot of Log (Mistakes) vs Speed shows that taking log of the value makes the plot more linear.

The suitable models to fit the data are Poisson Generalized linear model as this is a count data and a normal linear model could be a good fit.



***2(b)*** The statistical model fitted in the code is a GLM (Generalized linear model) with the family argument as Poisson (link= log) because the data of speed and mistakes here are in a Poisson distribution, that is GLM for Count data and a data argument between mistakes and speed is given as a formula.

`                                       `Log(mistakes) = 0.27143 +0.90598\*Speed

The summary () extractor function is used on speed.glm to get details of the regression performed on the experimental data which returns the deviance residuals,coefficents, null deviance and residual deviance.

***2(c)*** The number of fisher scoring iterations for the above model is 3, which means that it took 3 iterations for fisher’s scoring algorithm to fit the model onto the data.

***2(d)*** yes, the Poisson GLM model fits well with the data, which can be interpreted from the deviance residuals obtained by running the model which clearly shows that the residual values between the explanatory variable and the response variable are completely random which means that the model fits well with the data.

***2(e)*** The high null deviance value on 4 degrees of freedom shows that this model is not a good fit when only one parameter I.e., only intercept is considered, there is an alternative way to test Ho, which is by calculating the residual deviance, the low residual deviance on 3 degrees of freedom shows that the model is good fit when more than one predictor I.e., intercept is considered. The difference between null and residual deviance gives us the CHi^2 value per degrees of freedom, which in this case is 217.1108 on 1 degree of freedom, which is equal to a p value < 0.05, which means that null hypothesis can be rejected and the model is a good fit with an alternative hypothesis which takes in more than one predictor.




***2(f)*** The Statistical model fitted to the data is a linear model to which the input is given the log value of mistakes and the speed from the experimental data, the summary () extractor function is used on llm to return the details of residuals, coefficients, Residual standard error-Squared, F-statistic and the P-Value.

`                                          `Log*(mistakes) = -0.13208+1.01095\*speed*

The randomness of residual values shows that the model is a good fit for the data. A R-Squared value of 0.9847 is considered too high and implies that there is a high correlation between the variables.

A P-Value of 0.0008063 is obtained which is less than 0.05 which implies that we can reject the null hypothesis and the model is a good fit to the data, now checking the F-Statistic value which is 193.2 on 1 and 3 degrees of freedom and is high and implies that the model is a good fit for the data, because higher the F-Statistic value, Better the model.

***2(g)*** The R code below plots the data with Speed on X-Axis and logMistakes on Y-Axis using the plot(x,y) function. The abline() function is used to plot the regression lines using the coefficients obtained by running the regression models, I.e., linear model(llm) and Poisson GLM Model (speed. glm). An argument lty = 2 are given while plotting the regression line of the Poisson GLM model to represent it as a Dashed line. 

The legend of the graph is drawn using the legend () function, where 1,4.5 is its location on the chart and c ("Normal linear model with logMistakes", "Poisson GLM with log link") are the labels given to the legend with lty=1:2 to represent the solid and dashed lines, respectively.

***2(h)*** From the plot of (speed,logMistakes) with regression lines of the linear model(llm) and Poisson GLM Model(speed.glm) plotted the conclusions drawn are as follows:

1. The R-Squared value of normal linear model is greater than that of Poisson GLM model, because the data points fall much closer to the regression line of normal LM.
1. Clearly The slope of the solid regression line is more than that of the dashed, which means that there is a higher rate of change between the variables.
1. We can conclude that the normal linear model with logMistakes is the best fitting model for the data.


