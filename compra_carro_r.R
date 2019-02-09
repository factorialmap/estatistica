
#Importa os dados do excel
library(xlsx)
read.xlsx("C:/Users/User/Desktop/Lata/compra_carro.xlsx", 1) -> compra_carro


#Retira a primeira coluna da lista
library(dplyr)
compra_carro <- compra_carro %>% select (-1)


#Separa os dados com o CaTools

library(caTools)
dados_separados <- sample.split(compra_carro$comprou, SplitRatio = 0.65)
train_set <- subset(compra_carro, spli==T)
test_set <- subset(compra_carro, split_values==F)

#Carregando o Rpart
library(rpart)

#Construindo o modelo de classificacao
mod_class <- rpart(compra_carro~., data = train_set)
result_class <- predict(mod_class, test_set, type = "class")
table(test_set$compra_carro, result_class)

#2º caso - Regressao

#Calculando a Regressao
library(ggplot2)
View(dimonds)


#Separando os dados
library(caTools)
separa_dados <- sample.split(diamonds$price, SplitRatio = 0.65)
train_reg <- subset(diamonds, split_values==T)
test_reg <- subset(diamonds, split_values==F)

#Construindo modelo
modelo_regressao <- lm(price~., data = train_reg)
res.reg <- predict(modelo_regressao, test_reg)
dados_finais <- cbind(Actual= test_reg$price, predicted = res.reg)
dados_finais <- as.data.frame(dados_finais)

#Encontrando erros
Erro <- (dados_finais$Actual- dados_finais$predicted)
Dados_finais <- cbind(dados_finais, Erro)
rmse <- srqt(mean(Dados_finais$erro^2))
rmse


# Náo supervisionado utilizando o modelo Clustering

# Reduzindo os dados tirando a coluna de fator
iris_k <- iris[1:4]
iris_k <- as.matrix(iris_k)
iris_cluster <- kmeans(iris_k,3)
dados_agrupados <-cbind(iris, iris_cluster$cluster)

#=================================//==============================

#Reinforcement learning exaples


#Importando os dados
pokemon <- read.csv("C:/Users/User/Desktop/Lata/compra_carro.xlsx", 1)
view(pokemon)

#Removendo a primeira coluna
library(dplyr)
pokemon <- pokemon %>% select(-1)

# Renomeando as colunas
colnames(pokemon)[2] <- "Primary_Type"
colnames(pokemon)[3] <- "Secondary_Type"
colnames(pokemon)[5] <- "Health_Points"
colnames(pokemon)[8] <- "Special_Attach"
colnames(pokemon)[9] <- "Special_Defence"

# Entendendo os dados
str(pokemon)

# Tranformando as colunas renomeadas em fatores
pokemon$isLegendary <- as.factor(pokemon$isLegendary)
pokemon$hasMegaEvolution <- as.factor(pokemon$hasMegaEvolution)
pokemon$hasGender <- as.factor(pokemon$hasGender)

# Tipo de diferenças primarias
table(pokemon$Primary_Type)

# Selecionando os pokemons de grama
library(dplyr)
grass_pokemon <- pokemon %>% filter(Primary_Type == "Grass")
grass_poison_pokemon <- grass_pokemon %>% filter(Secondary_Type == " Poison")
range(grass_poison_pokemon$speed)
my_grass_pokemon <- grass_poison_pokemon %>% filter(speed=90)

# Selecionando os pokemons da agua
water_pokemon <- pokemon %>% filter(Primary_Type == "water")
water_psychic_pokemon <- water_pokemon %>% filter(Secondary_Type == "psychic")
range(water_psychic_pokemon$defence)
my_water_pokemon <- water_psychic_pokemon %>% filter(defence=110)

# Selecionando os pokemons do fogo
fire_pokemon <- pokemon %>% filter(Primary_Type == "fire")
fire_fighting_pokemon <- fire_pokemon %>% filter(Secondary_Type == "fighting")
range(fire_fighting_pokemon$Attack)
my_fire_pokemon <- fire_fighting_pokemon %>% filter(Attack=123)

#Colocando os 3 pokemons classificados em um mesmo dataset
my_pokemons <- rbind(my_fire_pokemon, my_water_pokemon, my_grass_pokemon)


#Regressão para entender qual a influencia do pokemon Attack

#Separando os dados
split_index <- sample.split(pokemon$Attack, SplitRatio = 0,65)
train1 <- subset(pokemon,split_index==T) 
test1 <- subset(pokemon,split_index==F)

# Construindo um modelo Attack contra Defesa
mod_regress <- lm(Attack - Defence, data = Tran1)
result_regress <- predict(mod_regress, test1)
dados_finais_pokemon <- cbind(Actual = test1$Attack, Predicted = result_regress)
dados_finais_pokemon <- as.data.frame(dados_finais_pokemon)


#Encontrado erro
Erro <- (dados_finais_pokemon$Actual - dados_finais_pokemon$predicted)
dados_finais_pokemon <- cbind(dados_finais_pokemon, erro)
rmsel <- sqrt(mean(dados_finais_pokemon$erro^2))

              






