#...---Lab 2---...Pedro Galindo Morey...

# Utilitzi la funció separada per transformar en columnes diferents la columna CVSS del conjunt de dades CVE. 

variable2 <- tidyr::separate(variable1, columnaData, c("nuevaColumna1","nuevaColumna2","nuevaColumna3"), sep = "/")

#Creeu una versió simplificada del conjunt de dades anterior que només contingui les columnes més importants.

simplificat <- dpylr::select(previousDataFrame, columnaImportante1, columnaImportante2, columnaImportante3)


#Desplaceu-vos a la finestra de les funcions que habiliten la mutation ().
dplyr::mutate(previousDataFrame, totalColumnaSumada = columna1 + columna2 + columna3)


#Combineu dos conjunts de dades diferents utilitzant una operació d'unió de dplyr.

left_joiin(columnaDF1, columnaDF2, by ="columnaDF1")

GetCWENamespace <- function(doc, cwe ="100") {
  xpath <- paste("//xsd:schema[@ID = '",
                 cwe,
                 "']/@targetNamespace",
                 sep = "")
  return(unlist(XML::xpathApply(doc,xpath))[["targetNamespace"]])
}

GetCWENamespace <- function(doc, cwe ="100") {
  xpath <- paste("//xsd:schema[xsd:annotation/xsd:annotation = '",
                 cwe,
                 "']",
                 sep = "")
  return(XML::xpathApply(doc,xpath))
}

#Completa funcions definides prèviament perquè el paquet permeti la generació d'un conjunt de dades que contingui la informació analitzada des del fitxer XML CPE.
#Juntem les llistes en un unic dataFrame
  df <- plyr::ldply(lcpes)

  ##........
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
 #.....
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