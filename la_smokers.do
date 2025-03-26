use "/Users/econlab/Desktop/brfss2015LA.dta"

gen smoker = 0
replace smoker = 1 if smokday2 == 1 | smokday2 == 2

gen marriage = 0
replace marriage = 0 if marital == 1
replace marriage = 1 if marital == 5

gen drinksResponsibly = 0
replace drinksResponsibly = 0 if drnk3ge5 <= 77
replace drinksResponsibly = 1 if drnk3ge5 == 88

reg smoker sex marriage drinksResponsibly

** -.0290329 represents the correlation between one's sex and their likelihood
** of being a smoker, with being male as the benchmark. Therefore, females have
** a ~2.90% less chance of being a smoker compared to males. .0463541
** represents the correlation between being married and smoking.  Those who are
** married are ~4.63 percent less likely to smoke than those who have never been
** married (ommitted those who had been married but were not currently married).
** -.017675 represents the correlation between whether or not someone binge 
** drinks and their likelihood of smoking.  Binge drinkers are ~1.76% less 
** likely to smoke as well.  .2504577 is the constant, which shows
** the likelihood of an unmarried, non-binge drinking woman is ~25.05%.  Anyone 
** who answered "Not Sure" was given the benchmark value for every independent
** variable.

estat hettest
estat imtest, white

** Both the Breush-Pagan and the White Tests for heteroskedasticity show
** heteroskedasticity in the data because the probability of approving the null
** hypothesis (aka that there is homoskedasticity) is .52% for the BP and 
** ~11.95% for the White Test - these show that there is no significance. For 
** the Breush-Pagan, the chi-squared value is 7.80 and for the White Test it is
** 10.12.

reg smoker pregnant marriage drinksResponsibly
estat hettest
estat imtest, white

** When including pregnancy instead of sex as an independent variable (I removed
** sex since there is obvious colinearity between being pregnant and one's sex), 
** the chi-squared value for the Breush-Pagan test is 1.20 which would indicate 
** a better regression since there is less heteroskedasticity.  The White Test's
** chi-squared value is 4.10 and also indicates that there is less
** heteroskedasticity.  There is also a 27.29% chance that the null hypothesis 
** that the null hypothesis will be approved according to the Breush-Pagan test 
** and ~76.88% chance according to the White Test.

** There is a very small negative correlation between pregancy and smoking
** (~-5.23% less chance of smoking if pregnant).  This could be detrimental to 
** fetal health and could also increase the chance of the child being addicted
** to nicotine if he/she is born.  The U.S. should enact a law forbidding
** pregnant women from smoking.
