################################## 
# Shapefile de Mexico sin islas #
# Jorge Juvenal Campos Ferreira #
#################################

# LIBRERIAS UTILIZADAS
library(sf)

# DIRECCION DEL SHAPE ORIGINAL
# este shapefile se descargo de la direccion 
# http://www.conabio.gob.mx/informacion/metadata/gis/destdv1gw.xml?_httpcache=yes&_xsl=/db/metadata/xsl/fgdc_html.xsl&_indent=no

# Carpeta donde vamos a trabajar
# root <- "/Users/admin/Desktop/Shape sin islas/" 

# Abrimos el shape en el R
shape <- sf::st_read(paste0(root, "Shape Original/destdv1gw.shp"))

# Generamos una variable dummy para asignarle una categoria a los territorios que son islas
shape$ni <- 0
shape$ni[shape$RASGO_GEOG == "ISLA"] <- 1

# Filtramos aquellos poligonos territoriales que no son islas y cuya area sea mayor a la de
# la ciudad de Mexico.
shape <- shape %>%
  filter(ni == 0) %>%
  filter(AREA > 1.275509e-01) %>%     # En caso de usar otro .shp, hay que corroborar esta area
  arrange(CVE_EDO)

# Eliminamos atributos o variables que no necesitemos
shape[,c('ni', 'RASGO_GEOG')] <- NULL

# Renombramos los estados (Aqui genere nombres sin acentos, por comodidad)
shape$ENTIDAD <-   plyr::revalue(shape$ENTIDAD, c("AGUASCALIENTES"                  	=	"Aguascalientes",
                                                  "BAJA CALIFORNIA"                 	=	"Baja California",     
                                                  "BAJA CALIFORNIA SUR"             	=	"Baja California Sur", 
                                                  "CAMPECHE"                        	=	"Campeche",            
                                                  "CHIAPAS"                         	=	"Chiapas",            
                                                  "CHIHUAHUA"                       	=	"Chihuahua",           
                                                  "COAHUILA DE ZARAGOZA"            	=	"Coahuila",    
                                                  "COLIMA"                          	=	"Colima",            
                                                  "DISTRITO FEDERAL"               	=	"Ciudad de Mexico",              
                                                  "DURANGO"                         	=	"Durango",                        
                                                  "GUANAJUATO"                      	=	"Guanajuato",          
                                                  "GUERRERO"                       	=	"Guerrero",            
                                                  "HIDALGO"                         	=	"Hidalgo",             
                                                  "JALISCO"                         	=	"Jalisco",            
                                                  "MEXICO"                         	=	"Mexico",              
                                                  "MICHOACAN DE OCAMPO"             	=	"Michoacan",           
                                                  "MORELOS"                         	=	"Morelos",             
                                                  "NAYARIT"                        	=	"Nayarit",             
                                                  "NUEVO LEON"                      	=	"Nuevo Leon",          
                                                  "OAXACA"                          	=	"Oaxaca",              
                                                  "PUEBLA"                         	=	"Puebla",              
                                                  "QUERETARO DE ARTEAGA"            	=	"Queretaro",           
                                                  "QUINTANA ROO"                    	=	"Quintana Roo",        
                                                  "SAN LUIS POTOSI"                	=	"San Luis Potosi",    
                                                  "SINALOA"                         	=	"Sinaloa",             
                                                  "SONORA"                          	=	"Sonora",              
                                                  "TABASCO"                        	=	"Tabasco",             
                                                  "TAMAULIPAS"                      	=	"Tamaulipas",          
                                                  "TLAXCALA"                        	=	"Tlaxcala",           
                                                  "VERACRUZ DE IGNACIO DE LA LLAVE"	=	"Veracruz",            
                                                  "YUCATAN"                         	=	"Yucatan",             
                                                  "ZACATECAS"   	                    =	"Zacatecas"))


# Escribimos el archivo *.shp en la misma carpeta donde estaba el original
sf::st_write(shape, paste0(root, "sin_islas.shp"))

root <- "/Users/admin/Desktop/Shape\ sin\ islas/"

# y asi tenemos nuestro shapefile sin islas.
# Es necesario decir que esta funcion st_write() no permite reescribir nuestro shapefile
# por lo que, si necesitamos correr varias veces el codigo, tendremos que hacerlo con nombres diferentes o 
# borrar los archivos generados (o encontrar como reemplazar el archivo creado cada vez que lo corremos)