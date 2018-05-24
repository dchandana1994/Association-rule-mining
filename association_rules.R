setwd('/Users/dimbul/Desktop/intern_apps/nebraska/')


df<-read.csv('final_modified_data.csv',)[,c('profession','marital','schooling','housing','loan','contact','month_derived','day_of_week','campaign_derived',
                                           'pdays_derived','previous_derived','poutcome','pastEmail_derived','responded')]



library(arules)
rules<-apriori(df,parameter = list(minlen=2, supp=0.005, conf=0.98),appearance = list(rhs=c("responded=no"),default="lhs"),control = list(verbose=F))
rules.sorted <- sort(rules, by="lift")
inspect(rules.sorted)
