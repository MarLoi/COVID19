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
estados <- levels(datos_aux$Province.State)
na_estados <- which(estados == '')
na_estados

regiones <- levels(datos_aux$Country.Region)
na_regiones <- which(regiones == '')
na_regiones


