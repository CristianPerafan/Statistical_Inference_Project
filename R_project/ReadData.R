
#readxl - Este paquete nos permite leer archivos de excel
library(readxl)

#Nos permite abrir una ventana para seleccionar archivo
rutaExcel<-file.choose()

#Leemos el archivo
BaseDatosBuena <- read_excel(rutaExcel,sheet = "dataset")

#Mostramos el archivo
#View(BaseDatosBuena)

#Nos devuelve las hojas de nuestro archivo
excel_sheets(rutaExcel)
             
documentaries <- read_excel(rutaExcel,sheet = "documentaries")
actionAdventure <- read_excel(rutaExcel,sheet = "ActionAndAdventure")
childrenFamilyMovies <- read_excel(rutaExcel,sheet = "horrorMovies")

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

#sample(documentaries$Duration,size = 118)

ConfidenceIntervalForTheMean(documentaries$Duration,0.95)


#Hipotesis de 1 grupo
zTestHaGreater<-function(sheet,ls,mu){
  n<-length(sheet)
  xbarra<-calculateMean(sheet)
  sd <- calculateStandarDeviation(sheet) 
  zcal <- (xbarra-mu)/(sd/sqrt(n)) 
  zval <- calculateZValue(1-ls)
  result <- data.frame(n,xbarra,sd,ls,zcal,zval)
  return(result)
}

zTest(documentaries$Score,0.05,5)
  

