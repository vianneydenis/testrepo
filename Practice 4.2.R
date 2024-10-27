rairuoho1 <- read.table("https://www.dipintothereef.com/uploads/3/7/3/5/37359245/rairuoho.txt", header = TRUE)

# 載入必要的套件
library(ggplot2)
library(tidyr)
library(dplyr)
library(ggthemes)  # 額外的主題樣式

# 整理數據，將 day3~day8 數據轉為長格式
rairuoho <- rairuoho1 %>%
  pivot_longer(cols = starts_with("day"),
               names_to = "day",
               values_to = "growth")

# 將天數轉換為因子，以控制繪圖順序
rairuoho$day <- factor(rairuoho$day, levels = c("day3", "day4", "day5", "day6", "day7", "day8"))

# 繪圖，區分 nutrient 和 water 處理
rairuoho_growth = ggplot(rairuoho, aes(x = day, y = growth, color = treatment)) +
  # 增加原始點
  geom_point(size = 4, alpha = 0.8, shape = 18) +
  
  # 平滑趨勢線，展示 nutrient 和 water 的連續變化
  geom_smooth(aes(group = treatment), method = "loess", se = TRUE, size = 1.5, alpha = 0.3) +
  
  # 使用漸變顏色來增強視覺效果
  scale_color_manual(values = c("nutrient" = "#FF1493", "water" = "#00F5FF")) +
  
  # 美化主題，強調視覺效果
  theme_minimal(base_size = 15) +
  theme(
    plot.background = element_rect(fill = "#222222", color = NA),
    panel.grid = element_line(color = "green"),
    legend.position = "top",
    legend.title = element_text(color = "white"),
    legend.text = element_text(color = "white"),
    plot.title = element_text(size = 20, hjust = 0.5, color = "white"),
    axis.text = element_text(color = "white"),
    axis.title = element_text(color = "white"),
    panel.background = element_rect(fill = "black", color = NA)) +
  
  # 添加標題和軸標籤
  labs(title = "Rairuoho Growth Data",
       x = "Times",
       y = "Germination")

ggsave("rairuoho.pdf", plot = rairuoho_growth, width = 10, height = 6, dpi = 300)