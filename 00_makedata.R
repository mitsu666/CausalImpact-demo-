# include 
install.packages("CausalImpact")
library(CausalImpact)

# fold確認
getwd()

# fold移動
setwd("dev/CausalImpact")

# dummyデータ作成 arima(1,0,1)
x <- 100 + arima.sim(n = 100, list(order=c(1,0,1), 
                                   ar = c(0.9), ma = c(0.2)),sd = 2)
y <- 1.5 * x + rnorm(100)
y[71:100] <- y[71:100] + 30

time.points <- seq.Date(as.Date("2022-01-01"), by = 1, length.out = 100)
data <- zoo(cbind(y, x), time.points)
matplot(data, type = "l")

# 出力
write.csv(data, file = "data.csv", row.names=FALSE)

