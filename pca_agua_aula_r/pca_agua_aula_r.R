# Chama pacotes a serem usados
library(xlsx)
library(FactoMineR)
library(factoextra)

# Importar dados do Excel
q_agua <- read.xlsx("C:/Users/User/Desktop/Lata/Quali_agua.xlsx", sheetIndex = 1)

# Visualizar os dados
View(q_agua.active)

# Remove qualquer dado nulo ou faltante presente nos dados 
q_agua <- na.omit(q_agua)

# O FactoMineR já faz a padronização automaticamente naõ sendo ncessário uso do scale.
q_agua.active <- scale(q_agua.active) 

# Criar subconjuntos de indivíduos ativos e variáveis ativas para a análise de componentes principais
q_agua.active <- q_agua[1:12, 2:5]

# Lista os dados na tabela com um numero de registros reduzidos limitados coluna 1 a 4 com 3 linhas 
head(q_agua.active[,1:4],3) 

# Gerar PCA
res.pca <- PCA(q_agua.active, graph = F)

# Extrair a proporcao de variancia dos valores de componentes principais
eig.val <- get_eigenvalue(res.pca)
eig.val

# Plotar no gráfico mostrando a proporção de variancia de cada variável
fviz_eig(res.pca, addlabels = T, ylim = c(0,50))
fviz_screeplot(res.pca)

#Extrair os resultados das variaveis do PCA par plotar no gráfico
var <- get_pca_var(res.pca)
ind <- get_pca_ind(res.pca)

# Plotar o gráfico de PCA
fviz_pca_var(res.pca, col.var = "blue")

# Criar grupo para cluster
grupo <- as.factor(q_agua[,1])

# Plotar novamente usando o gráfico Biplot
fviz_pca_biplot(res.pca, habillage = grupo, title = "Gráfio PCA Qualidade da Agua")


# Checar a qualidade da representação com Cos2 e gráfico
var$cos2

library(corrplot)
corrplot(var$cos2, is.corr = F)



