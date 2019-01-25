#install.packages("rvest")
#==================== https://www.meteored.cl/ ====================#

# 1.- Se realiza la búsqueda y se copia la URL generada
# 2.- Se asigna la url generada a la variable paginaTiempo
paginaTiempo <-"https://www.meteored.cl/tiempo-en_Santiago+de+Chile-America+Sur-Chile-Region+Metropolitana+de+Santiago-SCEL-1-18578.html"
webpageTiempo <- read_html(paginaTiempo)
#se quiere extraer prediccion del clima
# Extracción del la info contenida en la clase tabla-horas
tablaTiempo <- html_nodes(webpageTiempo, ".tabla-horas")
# Extracción del la info contenida en la clase hora
tablatiempohora<- html_nodes(tablaTiempo,".hora")
# Viendo el primer elemento de la variable tablatiempohora
print(tablatiempohora[1])
# Pasando la información contenida en tablatiempohora a texto
textotiempohora <- html_text(tablatiempohora)
# viendo el elemento 1 de la variable textotiempohora
print(textotiempohora[1])
# Extracción del la info contenida en la clase temperatura changeUnitT
tablatiempogrados<- html_nodes(tablaTiempo,".temperatura.changeUnitT")
# Viendo el primer elemento de la variable tablatiempogrados
print(tablatiempogrados[1])
# Pasando la información contenida en tablatiempogrados a texto
textotiempogrados <- html_text(tablatiempogrados)
# Viendo el primer elemento de la variable textotiempogrados
print(textotiempogrados[1])
# Extracción del la info contenida en la clase descripcion
tablatiempodescripcion<- html_nodes(tablaTiempo,".descripcion")
# Viendo el primer elemento de la variable tablatiempodescripcion
print(tablatiempodescripcion[1])
# Pasando la información contenida en tablatiempodescripcion a texto
textotiempodescripcion <- html_text(tablatiempodescripcion)
# Viendo el primer elemento de la variable textotiempodescripcion
print(textotiempodescripcion[1])
# Extracción del la info contenida en la clase datos-radiacion
tablatiempouv<- html_nodes(tablaTiempo,".datos-radiacion")
# Viendo el primer elemento de la variable tablatiempouv
print(tablatiempouv[1])
# Pasando la información contenida en tablatiempouv a texto
textotiempouv <- html_text(tablatiempouv)
# Viendo el primer elemento de la variable textotiempouv
print(textotiempouv[1])
#extrayendo fecha
fecha<- html_nodes(webpageTiempo, ".titulo")
# Viendo fecha
print(fecha)
# Se extraen todos los elementos
solofecha<- html_nodes(fecha, "span")
print(solofecha[1])
# Pasando la información contenida en solofecha a texto
textofecha <- html_text(solofecha)
# Viendo el primer elemento de la variable textofecha
print(textofecha[1])
# Quitando las comas
textofecha <- gsub(",","",textofecha)
# Viendo el primer elemento de la variable textofecha
print(textofecha[1])
# Unificando la información
dfTiempo<- data.frame(fecha = textofecha[1],hora = textotiempohora, grados = textotiempogrados, descripcion = textotiempodescripcion, uv = textotiempouv)

