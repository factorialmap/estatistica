fviz_cluster(km.res, data = df, ellipse.type = "norm" , ggtheme = theme_classic())


help("fviz_cluster")

pam.res <- pam(df, 3)


res.hc <- USArrests %>%
  scale() %>%
  dist(method = "euclidean") %>%
  hclust(method = "ward.D2" )

# Chama o pacote xlsx para importar dados
library(xlsx)

# Importação de dados
pdca <- read.xlsx("C:/Users/User/Desktop/Lata/Pesquisa.xls", colIndex=c(4,6,9,23,24), sheetIndex =1)


# Remove dado nulo/faltante presente nos dados use
pdca <- na.omit(pdca)

# Visualiza os dados da tabela PDCA
view(pdca)

# Chama pacotes a serem usados para MCA e Gráficos
library(FactoMineR)
library(factoextra)

# Gera a Matriz de correspondência múltipla nos 2 modelos individual e por variáveis
res.mca = MCA(pdca)
get_mca_var(res.mca)
get_mca_ind(res.mca)

# Para mostrar a contribuição das variáveis e individuais em gráfico
fviz_contrib(res.mca, choice = "var", axes =1)
fviz_contrib(res.mca, choice = "ind", axes =1, top=10)

# Para gerar o gráfico por variáveis
fviz_mca_var(res.mca, repel=TRUE)
fviz_mca_ind(res.mca, repel=TRUE)
fviz_mca_Biplot(res.mca, repel=TRUE)

# Criar grupo usando a var usa_pdca e gráfico com elipe separando esses grupos
grupo <- as.factor(pdca[,4])
fviz_mca_BIplot(res.mca, habillage = grupo, addEllipses = TRUE, repel = TRUE)
fviz_mca_biplot(res.mca, habillage = grupo, addEllipses = T, repel = T, title = "Mapa fatorial de uso do metodo PDCA", geom.ind = c("point"))
