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

#Frequencias absoluta e relativa
con_cur_freq_a <- table(contribui, curso)
con_cur_freq_r <- round(prop.table(con_cur_freq_a, margin = 2) * 100, 2)

exp_cur_freq_a <- table(expect, curso)
exp_cur_freq_r <- round(prop.table(exp_cur_freq_a, margin = 2) * 100, 2)

sex_curfreq_a  <- table(sexo, curso)
sex_curfreq_r  <- round(prop.table(sex_curfreq_a, margin = 2) * 100, 2)

#Criando so gráficos

png(file = "barplot_expec_curso.png")

barplot (
    exp_cur_freq_r,
    ylab      = "Frequencia relativa de espectativa (%)", 
    names.arg = curso_labels,
    col       = c("grey", "red", "orange", "yellow", "yellowgreen", "green"),
    las       = 2,
    ylim      = c(0,150),
    cex.names = 0.6,
)

legend("topright", expec_labels, fill = c("grey", "red", "orange", "yellow",
       "yellowgreen", "green"))

#-------------------------------------------------------------------------------

png(file = "boxplot_idade_trabalha.png")

boxplot (
    idade ~ trabalha,
    ylab     = "Idade (anos)",
    col      = rainbow(length(trabalha)),
    names    = trabalha_labels,
    cex.axis = 0.8
)

#-------------------------------------------------------------------------------

png(file = "barplot_sexo_curso.png")

barplot (
    sex_curfreq_r,
    ylab      = "Frequencia relativa de sexo (%)", 
    names.arg = curso_labels,
    col       = c("pink", "lightblue"),
    las       = 2,
    ylim      = c(0,150),
    cex.names = 0.6,
)

legend("topright", sexo_labels, fill = c("pink", "lightblue"))

#-------------------------------------------------------------------------------

png(file = "boxplot_h_estudo_curso.png")

boxplot (
    h_estudo ~ curso,
    ylab     = "Estudo (horas)",
    col      = rainbow(length(curso)),
    names    = curso_labels,
    cex.axis = 0.6,
    las = 2
)

#-------------------------------------------------------------------------------

renda = as.numeric(as.character(renda))

png(file = "boxplot_renda_trabalha.png")

boxplot (
    renda ~ trabalha,
    ylab     = "Renda (Salários minimos)",
    col      = rainbow(length(trabalha)),
    names    = trabalha_labels,
    cex.axis = 0.8
)

#-------------------------------------------------------------------------------

png(file = "boxplot_enem_idade.png")

boxplot (
    enem ~ idade,
    ylab     = "Enems feitos (unidades)",
    col      = rainbow(length(idade)),
    cex.axis = 0.8
)
