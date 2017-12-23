#Lab 2

No he conseguido encontrar el fichero necesario para realizar los primeros ejercicios del laboratorio, así que realizado los ejercicios de manera teórica.

1- Use the separate function to transform into different columns the CVSS column from the CVE data frame.

Para separar una columna de un data frame en varias columnas utilizaremos la funcion separate() del pakage tidyr. En este método, se indicará el data frame a separar,
la columna a separar, las nuevas columnas i el texto o carácter que nos indicará la separación:

variable2 <- tidyr::separate(variable1, columnaData, c("nuevaColumna1","nuevaColumna2","nuevaColumna3"), sep = "/")


2- Create a simplified version of the previous data frame that only contains the most important columns.
Para elegir las columnas importantes de un data frame utilizaremos la funcion select() del pakage dpylr. En este método,
se indicará el data frame de donde cogeremos las columnas importante y cada una de las columnas que extraeremos:

simpliificat <- dpylr::select(previousDataFrame, columnaImportante1, columnaImportante2, columnaImportante3)


3- Skim into the window functions that empower mutate().
Para juntar columnas de un data frame utilizaremos la funcion mutate() del pakage dpylr. En este método,
se indicará el data frame de donde cogeremos las columnas el nombre de la columna resultante y las columnas que juntaremos:

dplyr::mutate(previousDataFrame, totalColumnaSumada = columna1 + columna2 + columna3)


4- Combine two different data frames using a join operation from dplyr.

Para realizar un join de dos data frame podremos utilizar las diferentes funciones, por ejemplo, left_join(). En este método,
se indicará los dos dataframes y la columna en el cual se basará el join.
left_joiin(F1, DF2, by ="columnaDF1")

5 - Try to elaborate possible XPATH queries that could extract relevant information.

Este XPATH obtiene el atributo targetNamespace del primer nodo del XML:

GetCWENamespace <- function(doc, cwe ="100") {
  xpath <- paste("//xsd:schema[@ID = '",
                 cwe,
                 "']/@targetNamespace",
                 sep = "")
  return(unlist(XML::xpathApply(doc,xpath))[["targetNamespace"]])
}

Este XPATH obtiene la descripción del nodo annotation:

GetCWENamespace <- function(doc, cwe ="100") {
  xpath <- paste("//xsd:schema[xsd:annotation/xsd:annotation = '",
                 cwe,
                 "']",
                 sep = "")
  return(XML::xpathApply(doc,xpath))
}