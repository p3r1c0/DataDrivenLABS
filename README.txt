#Lab 2 -Pedro Galindo Morey-
No he aconseguit el fitxer necessari per realitzar els primers exercicis del laboratori, així que he realitzat els exercicis de manera teòrica.

1- Utilitzi la funció separada per transformar en columnes diferents la columna CVSS del conjunt de dades CVE. 
Per separar una columna de un data frame en diverses columnes utilitzarem la funció separate() del pakage tidyr. En aquest mètode, s'indicarà el data frame a separar, la columna a separar, las noves columnas i el text o caràcter que ens indicarà la separació:

transCols <- tidyr::separate(variable1, columnaData, c("newColumn_1","newColum_2","newColum_3"), sep = "/")

2- Creeu una versió simplificada del conjunt de dades anterior que només contingui les columnes més importants.
Per elegir les columnes importants d'un data frame utilitzarem la funció select() del pakage dpylr. En aquest mètode, s'indicarà el data frame d'on agafarem les columnes importants i cada una de les columnes que extraurem:

importantColums <- dpylr::select(previousDataFrame, colImp1, colImp2, colImp3)

3- Desplaceu-vos a la finestra de les funcions que habiliten la mutation ().
Per agrupar columnes d'una data frame utilitzarem la funció mutate() del pakage dpylr. En aquest mètode, s'indicarà el data frame d'on agafarem les columnes, el nom de la columna resultant i la columna que agruparem:

dplyr::mutate(previousDataFrame, totalColumnaSumada = col1 + col2 + col3)

4- Combineu dos conjunts de dades diferents utilitzant una operació d'unió de dplyr.
Per realitzar un join de dos data frame podrem utilitzar les diferents funcions, per exemple, left_join(). En aquest mètode, s'indicarà els dos dataframes i la columna en el qual es basarà el join.

left_joiin(colDF1, colDF2, by ="colDF1")

5 - Completa funcions definides prèviament perquè el paquet permeti la generació d'un conjunt de dades que contingui la informació analitzada des del fitxer XML CPE.
Amb la comanda següent conseguirem agrupar les files de data frames en una sola:

dataFrame <- plyr::ldply(lcpes)

#' Get data frame from CVE entry
#'
#' This function returns a single data frame
#' of one row containing th details from the
#' CPE passed as parameter.
#' @param cpe.raw
#'
#' @return data.frame
GetCPEItem <- function(cpe.raw) {
  cpe <- NewCPEItem()
  cpe.raw <- XML::xmlToList(cpe.raw)
  # transform the list to data frame
  # return data frame
}

#' Get CPE data frame
#'
#' The main function to parse CPE XML file. Expects one
#' parameter representing the file to be parserd.
#' Internally, makes use of XPath queries and plyr packages
#' to generate a R data frame with information extracted
#' from the XML file.
#' @param cpe.file file, the CPE XML file to be parsed.
#'
#' @return data.frame
ParseCPEData <- function(cpe.file) {
  doc <- XML::xmlTreeParse(cpe.file)
  cpes.raw <- XML::xmlRoot(doc)
  cpes.raw <- cpes.raw[2:length(cpes.raw)]
  # get list of CPEs (each one is a data frame)
  lcpes <- lapply(cpes.raw, GetCPEItem)
  # create single data frame from list
  df <- plyr::ldply(lcpes)
  # return data frame
  return(df)
}