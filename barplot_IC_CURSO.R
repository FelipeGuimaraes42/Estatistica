dados <- read.csv(
	file = "C:/Users/lucasmms/Documents/GitHub/Estatistica/code.csv",
	sep = ";",
	dec = ",",
	header=T
	)

attach(dados)

t1 <- table(ic,curso)
t1 <- round(prop.table(t1,margin=2)*100,2)

legendaCurso = c("Eng. Espacial", "Eng. Ambiental", "Eng. Controle", "Eng. Minas", "Eng. Produção",
	 "Eng. Sistemas", "Eng. Mecânica", "Eng. Metalúrgica", "Geologia", "Lic. Matemática", 
	 "Matemática", "Química", "Sist. Informação")

cor = rainbow(length(legendaCurso))

##
##FALTA LEGENDA
##NOMES SÃO PLOTADOS MUITO PEQUENOS
##

barCursoIc <- barplot(
	t1,
	names.arg = legendaCurso,
 	ylab = "Freq. Relativa de iniciação cientifica (%)", 
	xlab = "Cursos", 
	ylim = c(0,101), 
	xlim = c(0,15), 
	cex.names=0.25, 
	col = cor, 
	xaxs="i"
	)
