#Ou Fazer dessa forma chamar o pacote QCC
install.packages("qcc")
library(qcc)

# Criando tabela NC e Custo de retrabalho
nc <- c(201,78,47,31,15)
names(nc) <- c("Riscos", "Manchas", "Dobras", "Furos", "Rasgos")
pareto.chart(nc, ylab = "Frequencia do defeito", cumperc = seq(0,100, by=10))

# Criando tabela Custo de retrabalho
retrabalho <- c(4287,2423,1119,8947,1864)
names(retrabalho) <- c("Riscos", "Manchas", "Dobras", "Furos", "Rasgos")
pareto.chart(retrabalho, main="Por custo Retrabalho", ylab = "Frequencia do defeito", xlab="Tipo de defeito", cumperc = seq(0,100, by=5))



# 4 figures arranged in 2 rows and 2 columns
attach(mtcars)
par(mfrow=c(1,2))
plot(pareto.chart(nc, ylab = "Frequencia do defeito", cumperc = seq(0,100, by=10)))
plot(pareto.chart(retrabalho, main="Por custo Retrabalho", ylab = "Frequencia do defeito", xlab="Tipo de defeito", cumperc = seq(0,100, by=5)))

plot(wt,mpg, main="Scatterplot of wt vs. mpg")
plot(wt,disp, main="Scatterplot of wt vs disp")
hist(wt, main="Histogram of wt")
boxplot(wt, main="Boxplot of wt")
