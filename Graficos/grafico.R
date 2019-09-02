#Carregando os dados da pesquisa
dados <- read.csv("code.csv", sep = ";", dec = ",", header = T)

attach(dados)

curso_labels     <- c("Eng.Aeroespacial", "Eng.Ambiental" , "Eg.Controle" , "Eng.Minas",
                      "Eng.Produção"    , "Eng.Sistemas"  , "Eng.Mecanica", "Eng.Metalurgica",
                      "Geologia"        , "Lic.Matematica", "Matematica"  , "Quimica",
                      "SI")

contribui_labels <- c("Salário", "Mercado de trabalho" , "Vocação", "Estabilidade",
                      "Interesse pela área de pesquisa", "Sal/Mer",
                      "Sal/Voc", "Mer/Voc", "Voc/Int",
                      "Sala/Mer/Voc", "Sal/Voc/Est")

expec_labels     <- c("Nao sabe", "Pessima", "Ruim",
                      "Media"   , "Boa"    , "Otima")

trabalha_labels  <- c("Nao", "Emp. publica", "Emp. privada", "Emp. familiar",
                      "Outro")

sexo_labels      <- c("Feminino", "Masculino")

#Frequencia absoluta e relativa
cur_con_freq_a <- table(contribui, curso)
cur_con_freq_r <- round(prop.table(cur_con_freq_a, margin = 2) * 100, 2)

cur_exp_freq_a <- table(expect, curso)
cur_exp_freq_r <- round(prop.table(cur_exp_freq_a, margin = 2) * 100, 2)

cur_sex_freq_a <- table(sexo, curso)
cur_sex_freq_r <- round(prop.table(cur_sex_freq_a, margin = 2) * 100, 2)

#Criando os graficos
png(file = "barplot_contribui_curso.png")

barplot (
    cur_con_freq_r,
    ylab      = "Frequencia relativa de contribuição (%)", 
    main      = "Grafico de barras - contribui por curso",
    names.arg = curso_labels,
    col       = rainbow(length(contribui_labels)),
    las       = 2,
    ylim      = c(0,150),
    cex.names = 0.6
)

legend("topright", contribui_labels, fill = rainbow(length(contribui_labels)), cex = 0.6)

#-------------------------------------------------------------------------------

png(file = "barplot_expec_curso.png")

barplot (
    cur_exp_freq_r,
    ylab      = "Frequencia relativa de espectativa (%)", 
    main      = "Grafico de barras - expectativa por curso",
    names.arg = curso_labels,
    col       = c("grey", "red", "orange", "yellow", "yellowgreen", "green"),
    las       = 2,
    ylim      = c(0,150),
    cex.names = 0.6,
)

legend("topright", expec_labels, fill = c("grey", "red", "orange", "yellow", "yellowgreen", "green"))

#-------------------------------------------------------------------------------

png(file = "boxplot_idade_trabalho.png")

boxplot(
    idade ~ trabalha,
    ylab     = "Idade (anos)",
    main     = "Boxplot - trabalho por idade",
    col      = rainbow(length(trabalha)),
    names    = trabalha_labels,
    cex.axis = 0.8
)

#-------------------------------------------------------------------------------

png(file = "barplot_sex_curso.png")

barplot (
    cur_sex_freq_r,
    ylab      = "Frequencia relativa de sexo (%)", 
    main      = "Grafico de barras - sexo por curso",
    names.arg = curso_labels,
    col       = c("pink", "lightblue"),
    las       = 2,
    ylim      = c(0,150),
    cex.names = 0.6,
)

legend("topright", sexo_labels, fill = c("pink", "lightblue"))
