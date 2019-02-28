library(data.table)
library(ggplot2)


barcelona <- as.data.table(read.csv('results_barcelona.csv',header = T,sep=','))

madrid <- as.data.table(read.csv('results_Madrid.csv',header = T,sep=','))
 
madrid <- madrid[8:271,]
barcelona <- barcelona[8:271,]


media_madrid <- mean(madrid$avg_temp)
media_barcelona <- mean(barcelona$avg_temp)

calculo_madrid <- madrid$avg_temp-media_madrid
calculo_barcelona <- barcelona$avg_temp-media_barcelona

calculo <- calculo_madrid*calculo_barcelona
r1 <- sum(calculo)

potencia_madrid <- calculo_madrid^2
potencia_barcelona <- calculo_barcelona^2

suma_madrid <- sum(potencia_madrid)
suma_barcelona <- sum(potencia_barcelona)
r2 <- sqrt(suma_madrid)*sqrt(suma_barcelona)
correlacion_mad_bar <- r1/r2


print('This is the correlation calculated step by step')
correlacion_mad_bar

####################function
print('This is the correlation calculated by a r-function')
cor(madrid$avg_temp,barcelona$avg_temp)


##eliminir tendencias espureas
madrid1 <- madrid$avg_temp[2:264]
madrid2 <- madrid$avg_temp[1:263]
cormad <- madrid1-madrid2
barcelona1 <- barcelona$avg_temp[2:264]
barcelona2 <- barcelona$avg_temp[1:263]
corbar <- barcelona1-barcelona2

print('This is the correlation calculated to remove tendencies')
cor(cormad,corbar)
