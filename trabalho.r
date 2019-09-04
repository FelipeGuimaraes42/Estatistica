dados<- read.csv("code.csv", sep=";", dec=",", header=T)

#print(summary(dados))

#dados

head(dados)

#sexo

#dados$sexo

attach(dados)

#sexo

t1<- table(sexo)
t1

t2<- round(prop.table(t1)*100, 2)
t2


png("qtde-alunos-sexo.png")
legSex= c("Masculino", "Feminino");
cores= rainbow(length(legSex));
pie(t1, labels= t2, col= cores);
legend("topright", legSex, cex= 0.8, fill= cores);
dev.off()


t3<-table(curso)
t3
t4<- round(prop.table(t3)*100, 2)
t4
#	NÃO É O MELHOR CASO USAR GRAFICOS DE PIZZA
#legCurso= c("Eng. Espacial", "Eng. Ambiental", "Eng. Controle", "Eng. Minas", "Eng. Produção", 
#	 "Eng. Sistemas", "Eng. Mecânica", "Eng. Metalúrgica", "Geologia", "Lic. Matemática", 
#	 "Matemática", "Química", "Sist. Informação") 
#legCurso
#cores= rainbow(length(leg))
#pie(t3, labels=t4, col=cores)
#legend("bottomleft", legCurso, cex=0.8, fill=cores)


legCurso= c("Eng. Espacial", "Eng. Ambiental", "Eng. Controle", "Eng. Minas", "Eng. Produção",
	 "Eng. Sistemas", "Eng. Mecânica", "Eng. Metalúrgica", "Geologia", "Lic. Matemática", 
	 "Matemática", "Química", "Sist. Informação") 
legCurso
cores= rainbow(length(legCurso))


png("qtde-alunos-curso.png")
barraCurso<- barplot(t3, names.arg= legCurso, ylab= "Número de Alunos", las=2,
		 ylim=c(0,30), xlim=c(0, 15), cex.names=0.6, col= cores, xaxs= "i")
grid(nx= NA, ny= NULL)


barraCurso<- barplot(t3, names.arg= legCurso, ylab= "Número de Alunos", las=2,
		 ylim=c(0,30), xlim=c(0, 15), cex.names=0.6, col= cores, xaxs= "i", add=TRUE)
#legend("topleft", leg, cex=0.8, fill= cores)
dev.off()

t5<- table(idade)
t5
t6<- round(prop.table(t5)*100, 2)
t6

png("faixaEtariaXqtdeAlunos.png")
h<- hist(idade, freq=T, xlab= "Faixa Etária", ylab= "Número de Alunos",
     ylim= c(0, 30), col=cores, main=" ");
grid(nx=NA, ny=NULL)
text(h$mids, h$counts, labels=round(h$counts/53*100,2), adj=c(0.5, -0.5));
dev.off()

is.numeric(idade)
summary(idade)


#Boxplot relacionando idade e sexo
png("idadeXsexo.png")
boxplot(idade~sexo, ylab= "Idade (anos)", main= " ", col = "lightblue")
legend("topleft", legend=c("0 = Feminino", "1 = Masculino"))
dev.off()


#Boxplot relacionando horas de estudo e sexo
png("horasXsexo.png")
boxplot(h_estudo~sexo, ylab= "Horas de estudo", main= " ", col = "green")
legend("topleft", legend=c("0 = Feminino", "1 = Masculino"))
dev.off()


#####################################
#RELACIONANDO VARIÁVEIS QUALITATIVAS#
#####################################

t7<- table(curso, religiao)
t7

tCursoReli<- round(prop.table(t7)*100, 2)
tCursoReli

#
#Coloca nome nas linhas e colunas
#
nomes.coluna<- c("Catolica", "Evangelica", "Agnostico", "Ateu", "Judeu") 
#N temos espiritas
nomes.linha<- c("Eng. Espacial", "Eng. Ambiental", "Eng. Controle", "Eng. Minas", 
		    "Eng. Producao", "Eng. Sistemas", "Eng. Mecanica", "Eng. Metalurgica",
		    "Geologia", "Lic. Matematica", "Matematica", "Quimica", "Sist. Informacao")
dimnames(tCursoReli)<- list(nomes.linha, nomes.coluna)
tCursoReli

#
#Cria uma tabela relacionada
#
tCursoReli<- round(prop.table(t7, margin=1)*100,2)
tCursoReli

#
#Coloca nome nas linhas e colunas
#
nomes.coluna<- c("Catolica", "Evangelica", "Agnostico", "Ateu", "Judeu") 
#N temos espiritas
nomes.linha<- c("Eng. Espacial", "Eng. Ambiental", "Eng. Controle", "Eng. Minas", 
		    "Eng. Producao", "Eng. Sistemas", "Eng. Mecanica", "Eng. Metalurgica",
		    "Geologia", "Lic. Matematica", "Matematica", "Quimica", "Sist. Informacao")
dimnames(tCursoReli)<- list(nomes.linha, nomes.coluna)
tCursoReli

#Cria um gráfico de barras relacionando a religião com cada curso
png("religiaoXcurso.png")
barplot(t(tCursoReli),
        ylab="Frequência Relativa de Religião(%)",
        names.arg=nomes.linha, 
        cex.lab=0.8,
        cex.axis=0.8,
        cex.names=0.6,
        col= rainbow(length(nomes.coluna)),
        legend.text=T,
        ylim=c(0,150),
	  las= 2
	  )
dev.off()

t8<- table(local, sexo)
t8

tLocal<- round(prop.table(t8)*100,2)
tLocal

#
#Coloca nome nas linhas e colunas
#
nomes.linha<- c("Capital", "Interior do estado", "Outro Estado", "Outro País")
nomes.coluna<- c("Feminino", "Masculino")
dimnames(tLocal)<- list(nomes.linha, nomes.coluna)
tLocal


#Gráfico de barras
barplot(t(tLocal),
        ylab="Frequência Relativa de Sexo (%)",
	xlab= "Local de Nascimento",
        names.arg=nomes.linha, 
        cex.lab=0.8,
        cex.axis=0.8,
        cex.names=0.6,
        col= c("white", "black"),
        legend.text=T,
        ylim=c(0,100),
	las= 1
	  )


#################
#PRECISO ARRUMAR#
#################
#
#Cria uma tabela relacionada 2
#
tCursoReli<- round(prop.table(t7, margin=2)*100,2)
tCursoReli

#
#Coloca nome nas linhas e colunas
#
nomes.coluna<- c("Catolica", "Evangelica", "Agnostico", "Ateu", "Judeu") 
#N temos espiritas
nomes.linha<- c("Eng. Espacial", "Eng. Ambiental", "Eng. Controle", "Eng. Minas", 
		    "Eng. Producao", "Eng. Sistemas", "Eng. Mecanica", "Eng. Metalurgica",
		    "Geologia", "Lic. Matematica", "Matematica", "Quimica", "Sist. Informacao")
dimnames(tCursoReli)<- list(nomes.linha, nomes.coluna)
tCursoReli


#Cria um gráfico de barras relacionando a religião com cada curso
barplot(t(tCursoReli),
        ylab="Frequência Relativa de Religião(%)",
        names.arg=nomes.linha, 
        cex.lab=0.8,
        cex.axis=0.8,
        cex.names=0.6,
        col= rainbow(length(nomes.coluna)),
        legend.text=T,
        ylim=c(0,150),
	  las= 2      
	  )

#################
#PRECISO ARRUMAR#   OU RETIRAR
#################

#######################
#NECESSÁRIO PARA RENDA#
#######################
renda
is.numeric(renda)
renda= as.numeric(as.character(renda))
is.numeric(renda)
renda
summary(renda)

png("boxplot_Renda.png")
boxplot(renda, ylab="Renda dos Alunos da Turma TN (em salários mínimos)", col="chocolate")
grid(nx= NA, ny= NULL)
dev.off()

png("boxplot_renda_curso.png")
boxplot(renda~curso, xlab= "", ylab="Renda por curso (em salários mínimos)", 
	  col= rainbow(length(curso)), names= legCurso, cex.axis=0.6, cex.lab=1.2, las=2 )
grid(nx= NULL, ny= NULL)
dev.off()


#######################
#NECESSÁRIO PARA PESO #
#######################
peso
is.numeric(peso)
peso= as.numeric(as.character(peso))
is.numeric(peso)
peso

png("boxplot_peso.png")
boxplot(peso, ylab="Peso dos Alunos da Turma TN (em kg)", col="chocolate")
grid(nx= NA, ny= NULL)
dev.off()

png("boxplot_peso_curso.png")
boxplot(peso~curso, xlab= "", ylab="Peso por curso (em kg)", 
	  col= rainbow(length(curso)), names= legCurso, cex.axis=0.6, cex.lab=1.2, las=2 )
grid(nx= NULL, ny= NULL)
dev.off()






