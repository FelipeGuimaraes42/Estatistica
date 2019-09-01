#Trabalho em R - Interrelação entre espectativa do mercado e cursos

#Carregando dados do questionario
dados <- read.csv("code.csv", sep = ";", dec = ",", header = T)

attach(dados)

#Relacionando o numero de estudantes com a expectativa do mercado
curso_labels <- c("Eng.Aeroespacial", "Eng.Ambiental" , "Eg.Controle" , "Eng.Minas",
                  "Eng.Produção"    , "Eng.Sistemas"  , "Eng.Mecanica", "Eng.Metalurgica",
                  "Geologia"        , "Lic.Matematica", "Matematica"  , "Quimica",
                  "SI")

expec_labels <- c("Nao sabe", "Pessima", "Ruim",
                  "Media"   , "Boa"    , "Otima")

#Frequencia absoluta e relativa
cur_exp_freq_a <- table(expect, curso)
cur_exp_freq_r <- round(prop.table(cur_exp_freq_a, margin = 2) * 100, 2)

#Criando o grafico de barras
png(file = "barplot_expec_curso.png")

barplot (
    cur_exp_freq_r,
    ylab      = "Frequencia relativa de espectativa (%)", 
    main      = "Distribuição da espectativa do mercado, por curso",
    names.arg = curso_labels,
    col       = c("grey", "red", "orange", "yellow", "yellowgreen", "green"),
    las       = 2,
    ylim      = c(0,150),
    cex.names = 0.6,
)

#Legenda
legend("topright", expec_labels, fill = c("grey", "red", "orange", "yellow", "yellowgreen", "green"))



