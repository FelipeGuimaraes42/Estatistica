dados<- read.csv("code.csv", sep=";", dec=",", header=T)

#print(summary(dados))

#dados

#head(dados)

#sexo

#dados$sexo

attach(dados)

#sexo

t1<- table(sexo)
t1

t2<- round(prop.table(t1)*100, 2)
t2

legSex= c("Masculino", "Feminino");
cores= rainbow(length(leg));
pie(t1, labels= t2, col= cores);
legend("topright", legSex, cex= 0.8, fill= cores);

t3<-table(curso)
t3
t4<- round(prop.table(t3)*100, 2)
t4
#	N�O � O MELHOR CASO USAR GRAFICOS DE PIZZA
#legCurso= c("Eng. Espacial", "Eng. Ambiental", "Eng. Controle", "Eng. Minas", "Eng. Produ��o", 
#	 "Eng. Sistemas", "Eng. Mec�nica", "Eng. Metal�rgica", "Geologia", "Lic. Matem�tica", 
#	 "Matem�tica", "Qu�mica", "Sist. Informa��o") 
#legCurso
#cores= rainbow(length(leg))
#pie(t3, labels=t4, col=cores)
#legend("bottomleft", legCurso, cex=0.8, fill=cores)


legCurso= c("Eng. Espacial", "Eng. Ambiental", "Eng. Controle", "Eng. Minas", "Eng. Produ��o",
	 "Eng. Sistemas", "Eng. Mec�nica", "Eng. Metal�rgica", "Geologia", "Lic. Matem�tica", 
	 "Matem�tica", "Qu�mica", "Sist. Informa��o") 
legCurso
cores= rainbow(length(leg))
barraCurso<- barplot(t3, names.arg= legCurso, ylab= "N�mero de Alunos", las=2,
		 ylim=c(0,30), xlim=c(0, 15), cex.names=0.6, col= cores, xaxs= "i")
grid(nx= NA, ny= NULL)
barraCurso<- barplot(t3, names.arg= legCurso, ylab= "N�mero de Alunos", las=2,
		 ylim=c(0,30), xlim=c(0, 15), cex.names=0.6, col= cores, xaxs= "i", add=TRUE)
#legend("topleft", leg, cex=0.8, fill= cores)


t5<- table(idade)
t5
t6<- round(prop.table(t5)*100, 2)
t6
h<- hist(idade, freq=T, xlab= "Faixa Et�ria", ylab= "N�mero de Alunos",
     ylim= c(0, 30), col=cores, main=" ");
text(h$mids, h$counts, labels=h$counts, adj=c(0.5, -0.5));

is.numeric(idade)
summary(idade)

#####################################
#RELACIONANDO VARI�VEIS QUALITATIVAS#
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

#Cria um gr�fico de barras relacionando a religi�o com cada curso
barplot(t(tCursoReli),
        ylab="Frequ�ncia Relativa de Religi�o(%)",
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


#Cria um gr�fico de barras relacionando a religi�o com cada curso
barplot(t(tCursoReli),
        ylab="Frequ�ncia Relativa de Religi�o(%)",
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
#NECESS�RIO PARA RENDA#
#######################
is.numeric(renda)
renda= as.numeric(renda)
is.numeric(renda)

renda

summary(renda)

boxplot(renda, ylab="Renda dos Alunos da Turma TN (em sal�rios m�nimos)", col="chocolate")

boxplot(renda~curso, xlab= "", ylab="Renda por curso (em sal�rios m�nimos)", 
	  col= rainbow(length(curso)), names= legCurso, cex.axis=0.6, cex.lab=1.2, las=2 )
grid(nx= NULL, ny= NULL)








