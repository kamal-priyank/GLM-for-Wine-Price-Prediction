**Gamma Generalized Linear Model** 


***Justification of the chosen regression model specification:***

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

|coefficients|Estimate|Std.Error|Error t value|Pr|
| :- | :- | :- | :- | :- |
|intercept|76.228200|14.581488|5.228|8.29e-05|
|year|-0.039556|0.007535|-5.249|7.94e-05|
|s.temp|0.128617|0.059147|2.175|0.045|
|parker|0.035645|0.004700|7.585|1.10e-06|

Also, the residual deviance increases with two degrees of freedom after removing the highly insignificant variables, the R-Squared of the model is 0.84 which is a good fit.

***model summary & Interpretation:***

`                          `Log(price) = 76.22 -0.039\*year+0.128\*s.temp+0.035\*parker

We can infer from this equation that s.temp is a less significant positive predictor, year being a negative predictor of high significance and parker is a highly significant positive indicator which influences the price.

The summary table of the gamma GLM model fitted to the wine data

The above summary statistics shows us and AIC of 109.76 which is less than what we got initially when all the variables were selected, also the AIC when the canonical link taken as inverse gives us an aic of 106.5 which is even better, but it makes the s.temp variable insignificant, which is why we go with the gamma model with link being log.

The high null deviance of the model allows us to reject the null hypothesis, which means only intercept is not enough to explain the response variable and the low residual deviance value explains that the model is a good fit when the significant variables including the intercept are considered.

With the use of null and residual deviances, we calculate the R-squared value of the model I.e., 0.84, which shows us the goodness of fit of the model.

***Residual Plots:***

<p align="center">
<img width="360" alt="image" src="https://user-images.githubusercontent.com/66077662/193459617-699bbe3f-f1da-487d-9071-fba12d848583.png">
</p>
<h5 align="center">Residual Plots</h5>



From the residual plots shown above we can see that most of the residuals are plotted close to the zero line randomly which means that the predictions are reasonable and do not show any skewness in the plot. The normal Q-Q plot also shows a good alignment of the residuals along the straight line which indicates that they are normally distributed, the scale-location plot shows us that the residuals are equally distributed below and above the line which shows that they have a constant variance. Now looking at the residuals vs leverage plot we can clearly say that there are no residuals outside cook’s distance. 

***Limitations and Recommendations:***

There are some outliers which lie in the data which makes the data a little skewed, which might the affect result of the regression, these can be remove which will make the regression more efficient and give accurate results but doing this would result in eliminating one more predictor variable, which would leave us with the most obvious predictors.

The relationships of price found with the predictors may not hold true if other factors or additional predictors are considered such as age of the wine etc.

The number of variables being less makes the price depending on only a few predictors, Which might not be the case if there were more predictors and also making the parker into categories and grading it in level ranging from bad to excellent.

***Improvements and learning from the analysis:***

The major takeaways from the analysis are that only three variables out of six are significant in predicting the price of the Bordeaux wines. However, as I thought that the rain the harvest month(h.rain) and rain in the winter preceding the harvest(w.rain) would have no significance in predicting the price, which turned out to be True from the analysis.

There would be a significant increase in efficiency to predict the price of the wine if more explanatory variables such as age and year of harvest were considered, we could also consider the wine scoring scale of Robert Parker and classify the quality of the wine, these improvements when considered can gradually increase the R-squared value which increases if the number of significant explanatory variables increases. 



