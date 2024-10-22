#saving plot
setwd("C:/Users/Esdeath/Desktop")
pdf("iris_data.pdf", width = 8, height = 5)

#create the data
setosa <- iris[iris$Species == "setosa" ,]
versicolor <- iris[iris$Species == "versicolor" ,]
virginica <- iris[iris$Species == "virginica" ,]

#draw the plot
plot(setosa$Petal.Length, setosa$Petal.Width,
     xlab = "Petal length (cm)", ylab = 'Petal width (cm)',
     xlim = range(iris$Petal.Length), ylim = range(iris$Petal.Width), 
     main = "Petal width vs. length",
)
# add the other species
points(versicolor$Petal.Length, versicolor$Petal.Width, col = 2, pch = 2)
points(virginica$Petal.Length, virginica$Petal.Width,  col = 3, pch = 3)

#add legend
legend("topleft",legend = c("setosa","versicolor","virginica"), col= 1:3,pch = c(1, 2, 3) ) 

#add the regression line and text
fit <- lm(Petal.Width ~ Petal.Length, data = iris)
abline(fit)
regression = summary(fit)$r.squared#算出相關性
text(5, 0.5, labels = paste("R= ", round(sqrt(regression), 2)), pos = 4)#加上相關性

dev.off()