students_data <- read.fwf("TEMA 1/DATA/student-fwf.txt"
                          ,widths = c(4,15,20,15,4),
                          col.names = c("id","nombre","email","carrera","año"))

students_data_header <- read.fwf("TEMA 1/DATA/student-fwf-header.txt"
                                 ,widths = c(4,15,20,15,4),
                                 header =TRUE, sep ="\t"
                                 ,skip = 2)
