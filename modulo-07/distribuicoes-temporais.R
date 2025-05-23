### Analizando distribuições dados saída


# Lembram do que o professor ensinou na aula passada? Então, basicamente
# para verificar se os dados seguem uma distribuição aleatória, vamos
# gerar uma distribuição aleatória esperada baseada nos nossos dados
# O pacote goodfit faz isso automaticamente pra gente:
install.packages("vcd")
library(vcd)


extinctData = read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08e6MassExtinctions.csv"))

View(extinctData)

# Vamos gerar a distribuição e realizar o teste de qui quadrado, para
# verificar a hipótese de que os dados seguem uma distribuição de poisson:
# Verificamos primeiro com a poisson pois, caso a distribuição
# seja de poisson, significa que a distribuição é aleatória, portanto
# tende a não seguir padrões. Confirmando isso, sabemos que segue um
# padrão e, podemos ir atras dele. Em distribuições uniformes
# temos a média maior (ou ligeiramente menor) que a variância,
# sendo que a divisão média/variância > 1, em contrapartida
# a=uma distribuição agregada tem média menor que variância,
# sendo que a divisão média/variância <1.
p = goodfit(extinctData$numberOfExtinctions,type = "poisson")
hist(extinctData$numberOfExtinctions)


?goodfit
# Para verificarmos o resultado do qui quadrado usamos o summary
summary(p)

# H0:Segue a dist. aleatória
# H1: Não segue dist. aleatória

# p >0.05 = Aceita H0
# p <0.05 = Rejeita H0

# Conclusão : Rejeito H0; Não segue uma distribuição aleatória
