library(readxl)
consolidado_orig_mod_01_bioquant_v2 <- read_excel("modulo-01/consolidado-orig-mod-01-bioquant-v2.xlsx", 
                                                  col_types = c("text", "text", "text", 
                                                                "text", "numeric", "numeric", "numeric", 
                                                                "text", "text"))
View(consolidado_orig_mod_01_bioquant_v2)

consolidado= consolidado_orig_mod_01_bioquant_v3

#Vamos fazer a organização e sistematização dos dados
#Mudar de maiúsculas para minúsculas
#Um grupo usou códigos numéricos em vez de letras para o local. vamos recodificar
#mudar de tabela para dataframe
consolidado <- as.data.frame(consolidado_orig_mod_01_bioquant_v3)

#Mudar de maiuscula para minuscula:
consolidado$jardim = tolower(consolidado$jardim)
consolidado$local = tolower(consolidado$local)
consolidado$grupo = tolower(consolidado$grupo)
consolidado$amostra <- tolower(consolidado$amostra)
consolidado$temperatura = as.numeric(consolidado$temperatura)
consolidado$jardim = as.factor(consolidado$jardim)
consolidado$local = as.factor(consolidado$local)
consolidado$grupo = as.factor(consolidado$grupo)
consolidado$amostra =as.factor(consolidado$amostra)
consolidado$altura =as.factor(consolidado$altura)
#recodificar
#install.packages("dplyr")
#library(dplyr)
#if(consolidado$amostra == "hdlk" | consolidado$jardim == "ad" & consolidado$local == "1.0") {recode(consolidado$local, "1.0" = "pc")}
#recode(consolidado$local, "1.0" = "ah", "2.0" = "as", "3.0" = "sh", "4.0" = "ss")

boxplot(temperatura ~ jardim, data=consolidado, xlab="Jardim", ylab="temperatura", outline=FALSE)
boxplot(umidade ~ jardim, data=consolidado, xlab="Jardim", ylab="Umidade Relativa %", outline=FALSE)
boxplot(temperatura ~ grupo, data=consolidado, xlab="grupo", ylab="temperatura", outline=FALSE)
ggplot(consolidado, aes(x=local,y=temperatura, fill = jardim))+ geom_boxplot()
ggplot(consolidado, aes(x=local,y=umidade, fill = jardim))+ geom_boxplot()
shapiro.test(consolidado$temperatura)
shapiro.test(consolidado$umidade)
# Compute the analysis of variance
res.aov <- aov(umidade ~ local, data = consolidado)
# Summary of the analysis
summary(res.aov)
TukeyHSD(res.aov)
boxplot(umidade ~ altura, data=consolidado, xlab="Altura", ylab="Umidade Relativa %", outline=FALSE)
