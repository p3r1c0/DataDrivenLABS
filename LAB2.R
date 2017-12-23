#Lab 2

#Use the separate function to transform into different columns the CVSS column from the CVE data frame.

variable2 <- tidyr::separate(variable1, columnaData, c("nuevaColumna1","nuevaColumna2","nuevaColumna3"), sep = "/")

#Compare the output produced by summary and glimpse functions to describe the CPE data frame.


#Create a simplified version of the previous data frame that only contains the most important columns.

simpliificat <- dpylr::select(previousDataFrame, columnaImportante1, columnaImportante2, columnaImportante3)


#Skim into the window functions that empower mutate().
dplyr::mutate(previousDataFrame, totalColumnaSumada = columna1 + columna2 + columna3)


#Combine two different data frames using a join operation from dplyr.

left_joiin(columnaDF1, columnaDF2, by ="columnaDF1")

#Try to elaborate possible XPATH queries that could extract relevant information.

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

#Complete previously defined functions so that the package allows the generation of a data frame containing the data parsed from the CPE XML file.

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
  # ...

  # return data frame
}
