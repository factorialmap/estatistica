# Chama pacotes a serem usados
library(xlsx)
library(tibble)
library(dplyr)
library(lubridate)
library(ggplot)

# Importar dados do Excel
dados_cagr <- read.xlsx("C:/Users/User/Desktop/Lata/dados_cagr_aula_r.xlsx", sheetIndex = 1)


# Criando os vetores com os valores e juntando num data frame com o comando tibble
year<-c(rep(2000:2004,2))
company<-rep(c("ABC","CDE"),5)
variable<-rep("revenue",10)
data<-c(10,15,12,25,30,5,8,17,9,34)
tibdf<-tibble(company,year,variable,data)
View(tibdf)

#Criando o CAGR atraves de uma funcao
calc_cagr <- function(df, n) {
  df <- df %>%
    arrange(company, year) %>%
    group_by(company) %>%
    mutate(cagr = ((data / lag(data, n)) ^ (1 / n)) - 1)
  
  return(df)
}

calc_cagr(tibdf, 2)

#plotando graficos com outros valores

# Code to replicate the above mentioned data frame   
data.Frame <- data.frame(Month = c(1,1,1,2,2,2,3,3,3,4,4,4),Country = c("Fr","Uk","It"),
                         Revenue = c(1100,900,800,1200,1050,900,1350,1200,1000,1300,1250,950)).

plot_rev <- ggplot(data.Frame, aes(Month, Revenue, fill = Country, ymax = max(Revenue)+100,
                                   title = "Revenue (in 1000???) per Country per Month in 2014"))


annual.growth.rate <- function(a){
  
  T1 <- max(a$Month) - min(a$Month)+1
  FV <- a[which(a$Month == max(a$Month)),"Revenue"]
  SV <- a[which(a$Month == min(a$Month)),"Revenue"]
  cagr <- ((FV/SV)^(1/T1)) -1
  
}

gr <- data.Frame(x = unique(data.Frame$Country),y= 1:length(unique(data.Frame$Country)))

colnames(gr) <- c("country","cagr")

for(i in 1: nrow(gr)){
  gr[i,2] <- round(annual.growth.rate(data.Frame[which(data.Frame$Country == gr[i,1]),]),digits = 2)
}

# Growth Curve Function
FV = PV*(1+cagr)^T
