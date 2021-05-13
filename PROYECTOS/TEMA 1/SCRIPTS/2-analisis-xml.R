install.packages("XML")

#Creo variable con la ruta del archivo
url <- "TEMA 1/DATA/cd_catalog.xml"

#Creo un xml interno
xmldoc <- xmlParse(url)

#Pasar por los nodos (rootnode nos manda al origen del fichero)
rootnode <-xmlRoot(xmldoc)
rootnode[1]

#Creo un nuevo espacio donde almacenar cada uno de los valores disponibles en el xml
cds_data <- xmlSApply(rootnode, function(x) xmlSApply(x,xmlValue))

#Convierto ese espacio donde almacene los valores en un dataframe llamado cds.catalog
cds.catalog <-data.frame(t(cds_data),row.names = NULL)
head(cds.catalog,2)
cds.catalog[1:5,]


#xpathSApply()
#getNodeSet()

population_url <-"TEMA 1/DATA/WorldPopulation-wiki.htm"
tables <-readHTMLTable(population_url)

most_populated <- tables[[6]]
head(most_populated, 3)

custom_table <- readHTMLTable(population_url, which =6)
