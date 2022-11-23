library(readxl)

## **Códigos**
rutaExcel <- "C:/Users/Cristian Perafan/Desktop/Statistical_Inference_Project/R_project/dataSet/BaseDatosBuena.xlsx"
#rutaExcel<-file.choose()

anovaData <- read_excel(rutaExcel,sheet = "Anova")

attach(anovaData)
library(rapportools)
boxplot(Score~Genres)

anova <- aov(Score~Genres)
summary(anova)



TukeyHSD(anova)
plot(TukeyHSD(anova))
