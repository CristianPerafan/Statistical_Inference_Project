


#readxl - Este paquete nos permite leer archivos de excel
library(readxl)
library(tidyverse)
library(ggplot2)

#Nos permite abrir una ventana para seleccionar archivo
rutaExcel<-file.choose()

#Leemos el archivo
BaseDatosBuena <- read_excel(rutaExcel,sheet = "dataset")

#Mostramos el archivo
#View(BaseDatosBuena)

#Nos devuelve las hojas de nuestro archivo
excel_sheets(rutaExcel)
             
documentaries <- read_excel(rutaExcel,sheet = "d118")
actionAdventure <- read_excel(rutaExcel,sheet = "hM118")
childrenFamilyMovies <- read_excel(rutaExcel,sheet = "AA118")

# - Hallar media muestra 

calculateMean<-function(sheet){
  result <-mean(sheet)
  return(result)
}

calculateStandarDeviation<-function(sheet){
  result <- sd(sheet)
  return(result)
}

calculateZValue<-function(confidenceLevel){
  zValue<- qnorm(c(confidenceLevel),mean=0,sd=1,lower.tail=TRUE)
  return(zValue)
}

calculateStandarError<-function(sd,n){
  standarError <- sd/(sqrt(n))
  return(standarError)
}

ConfidenceIntervalForTheMean<-function(sheet,confidenceLevel){
  
  n <- length(sheet)
  resultMean <- calculateMean(sheet)
  sd <- calculateStandarDeviation(sheet) 
  cl <- confidenceLevel*100
  z <- calculateZValue(confidenceLevel)
  standarError <- calculateStandarError(sd,n)
  limInf <- resultMean-(z*standarError)
  limSup <- resultMean+(z*standarError)
  
  result <- data.frame(n,resultMean,sd,cl,standarError,limInf,limSup)
  
  return(result)
  
}




#Hipotesis de 1 grupo

zTestHaGreater<-function(sheet,ls,mu){
  n<-length(sheet)
  xbarra<-calculateMean(sheet)
  sd <- calculateStandarDeviation(sheet) 
  zcal <- (xbarra-mu)/(sd/sqrt(n)) 
  zval <- (calculateZValue(1-ls)*-1)
  ho <- zcal<=zval
  result <- data.frame(n,xbarra,sd,ls,zcal,zval)
  return(result)
}

#Hipotesis de 2 grupos (muestras independientes)
dataFrameH2<- read_excel(rutaExcel,sheet = "pruebasH2")

#Distribución normal
ggplot(dataFrameH2,aes(Score,fill = Genres, color = Genres))+
  geom_density(alpha=0.1)+
  xlim(1,10)

#Gráfico de cajas
ggplot(dataFrameH2,aes(Genres,Score,fill = Genres, color = Genres))+ 
  geom_boxplot(alpha=0.4)+
  theme(legend.position = "none")
#Permite obsevar si tenemos valores atipicos 

dataFrameH2 %>%
  group_by(Genres)  %>%
  summarize(total = n(),xbarra=mean(Score))

 

t.test(Score ~ Genres,data = dataFrameH2)
