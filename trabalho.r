dados<- read.csv("code.csv", sep=";", dec=",", header=T)

print(summary(dados))

dados

head(dados)

sexo

dados$sexo

attach(dados)

sexo

t1<- table(sexo)
t1

t2<- round(prop.table(t1)*100, 2)
t2

leg= c("Masculino", "Feminino");
cores= rainbow(length(leg));
pie(t1, labels= t2, col= cores);
legend("topright", leg, cex= 0.8, fill= cores);

t1<-table(curso)
t1
t2<- round(prop.table(t1)*100, 2)
t2
#	NÃO É O MELHOR CASO USAR GRAFICOS DE PIZZA
#leg= c("Eng. Espacial", "Eng. Ambiental", "Eng. Controle", "Eng. Minas", "Eng. Producao", 
#	 "Eng. Sistemas", "Eng. Mecanica", "Eng. Metalurgica", "Geologia", "Lic. Matematica", 
#	 "Matematica", "Quimica", "SI") 
#leg
#cores= rainbow(length(leg))
#pie(t1, labels=t2, col=cores)
#legend("bottomleft", leg, cex=0.8, fill=cores)





