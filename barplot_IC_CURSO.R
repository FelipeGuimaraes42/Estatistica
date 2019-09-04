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
##NOMES SÃO PLOTADOS MUITO PEQUENOS
##FALTA LEGENDA PARA AS CORES
##

barCursoIc <- barplot(
	t1,
	names.arg = legendaCurso,
 	ylab = "Iniciacao Cientifica (%)", 
	xlab = "", 
	ylim = c(0,101), 
	xlim = c(0,23), 
	cex.names=0.6, 
	col = cor, 
	xaxs="i",
	las=2,
)

#title(
#	xlab = "",
#	line = 0,
#	cex.lab = 0.6
#)

legend(
	"topright",
	legend = c("Não faz IC","IC com Bolsa","IC sem Bolsa","IC Voluntária"),
	fill = cor,
	bty = "n"
) 
