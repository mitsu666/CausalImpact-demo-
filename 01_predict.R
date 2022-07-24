# include 
install.packages("CausalImpact")
library(CausalImpact)

# fold確認
getwd()

# fold移動
setwd("dev/CausalImpact")

# 0. read_table
data = read.csv(file = "data.csv")

# 1. データ確認
# 1.1 時系列index入力
time.points <- seq.Date(as.Date("2022-01-01"), by = 1, length.out = 100)
data <- zoo(data, time.points)
# 1.2 plot
matplot(data, type = "l")

# 2. 解析開始
# 2.1 キャンペーン開始と終了時期を入力
pre.period <- as.Date(c("2022-01-01", "2022-03-11"))
post.period <- as.Date(c("2022-03-12", "2022-04-10"))

# 2.2 解析
impact <- CausalImpact(data, pre.period, post.period)
plot(impact)

# 2.3 結果可視化
summary(impact)
# レポート詳細
summary(impact, "report")
# テーブルで出力
impact$summary

# 3. option モデル (発展)
impact <- CausalImpact(data, pre.period, post.period,
                       model.args = list(nseasons = 7))
plot(impact)

# 結果可視化
summary(impact)
# レポート詳細
summary(impact, "report")
# テーブルで出力
impact$summary

# 4. MROIを求める
# キャンペーン投下費用
cost = 400
(impact$summary$AbsEffect[2] / 400) * 100

