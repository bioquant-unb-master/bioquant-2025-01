library(readxl)
consolidado_orig_mod_01_bioquant_v2 <- read_excel("modulo-01/consolidado-orig-mod-01-bioquant-v2.xlsx", 
                                                  col_types = c("text", "text", "text", 
                                                                "text", "numeric", "numeric", "numeric", 
                                                                "text", "text"))
View(consolidado_orig_mod_01_bioquant_v2)

consolidado= consolidado_orig_mod_01_bioquant_v2

#Vamos fazer a organização e sistematização dos dados
#Mudar de maiúsculas para minúsculas
#Um grupo usou códigos numéricos em vez de letras para o local. vamos recodificar

#Mudar de maiuscula para minuscula:
consolidado$jardim = tolower(consolidado$jardim)
consolidado$local = tolower(consolidado$local)
consolidado$grupo = tolower(consolidado$grupo)
consolidado$amostra <- tolower(consolidado$amostra)


#recodificar
install.packages("dplyr")
library(dplyr)
if(x == TRUE) {print("x was true!")}
recode(consolidado$local, "1.0" = "ah", "2.0" = "as", "3.0" = "sh", "4.0" = "ss")
