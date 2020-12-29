#Librerias
library(utils)
library(dplyr)


#Lectura de datos 
unzip <- unzip("DATA/covid-19-all.csv.zip", exdir = getwd())
datos <- read.csv("covid-19-all.csv", header = T)


#Formato 
datos$Date <- as.Date(datos$Date)
datos$Country.Region <- as.factor(datos$Country.Region)
datos$Province.State <- as.factor(datos$Province.State)


#2.1 Seleccion de datos 
longlat <- c("Longitude", "Latitude")
index <- which(colnames(datos) %in% longlat)
datos_aux <- datos[, -index]
#

#3.1 Valores NA
summary(datos_aux)

#3.1 Eliminar los valores  Confirmed    
datos_aux <- datos_aux %>% filter( !(is.na(Confirmed) & (Country.Region == 'Mexico' | Country.Region == 'Colombia'  | 
                                          Country.Region == 'Philippines' | Country.Region == 'Brazil' |
                                          Country.Region == 'Malaysia'| Country.Region == 'Australia')))





 index <- which(is.na(datos_aux$Confirmed))

datos_aux %>% filter( Confirmed == 'NA' & Country.Region == 'Mexico')



datos_aux[(index & datos_aux$Country.Region == 'Colombia'),]


index 



#3.1 Valores faltantes  Recovered






#3.1 Valores faltantes Deaths

colnames(datos_aux)











estados <- levels(datos_aux$Province.State)
na_estados <- which(estados == '')
na_estados

regiones <- levels(datos_aux$Country.Region)
na_regiones <- which(regiones == '')
na_regiones


