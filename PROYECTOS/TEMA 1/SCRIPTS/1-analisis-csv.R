auto <-read.csv("DATA/auto-mpg.csv",header = TRUE, sep = ",",  stringsAsFactors = FALSE)
names(auto)

#read.csv2 == read.csv("filename, sep = ";", dec = ",")
# sep = "t"
# Read.csv o read.csv2 son funciones encargadas de leer archivos en formatos de tabla csv creando un dataframe con el que se pueda trabajar.

auto_no_header <-read.csv("DATA/auto-mpg-noheader.csv", header = FALSE, sep =",")
head(auto_no_header,8)

auto_custom_header <-
  read.csv("DATA/auto-mpg-noheader.csv",
           header = FALSE, 
           col.names= c("numero","millas_por_galeon","cilindrada",
                        "desplazamiento","caballos_de_potencia","peso",
                        "aceleracion","año","modelo")
           )

head(auto_custom_header,2)


#NA: not available
#na.strings=""
#as.character()