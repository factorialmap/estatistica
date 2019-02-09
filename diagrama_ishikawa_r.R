#criar um diagrama de Ishikawa no R

#Chamado o pacote QCC
library(qcc)

#Criando o diagrama usando a funcao cause effect
cause.and.effect(cause = list(Medida   = c("Aferição","Acompanhamento","Indicador"),
                              Material = c("Qualidade","Padronização","Entrega"),
                              Pessoas  = c("Comunicação","Disciplina","Criatividade"),
                              Ambiente = c("Calor","Frio","Espaço"),
                              Metodo   = c("Procedimento","Etapas","Manuais"),
                              Maquina  = c("Equipamento","Ferramenta","Instrumentos")),
                 effect = c("Redução/Aumento no Nº Defeitos"), 
                 title = "Diagrama de causa efeito" , 
                 cex = c(1, 1, 1), 
                 font = c(2, 1, 2))
                   
                   
