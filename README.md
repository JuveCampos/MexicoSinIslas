# MexicoSinIslas

El presente repositorio se divide en 3:

* Una carpeta con un shapefile descargado de la CONABIO.

* Un script en R para modificar dicho shapefile original y utilizarlo para nuestros propósitos (en este caso, quitarle las islas)

* Un shapefile sin islas creado con el script en R mencionado previamente.

El shapefile original proviene de la página de la CONABIO y se puede descargar en la siguiente liga:
http://www.conabio.gob.mx/informacion/metadata/gis/destdv1gw.xml?_httpcache=yes&_xsl=/db/metadata/xsl/fgdc_html.xsl&_indent=no


La paqueteria "sf" utilizada para manipular dicho shapefile: 
Edzer Pebesma (2017). sf: Simple Features for R. R package version 0.5-4.
  https://CRAN.R-project.org/package=sf

Comentarios, dudas o sugerencias, favor de comunicarlas!
(Con confianza! no muerdo :p y todos estamos aprendiendo )

Jorge Juvenal Campos Ferreira

(**Actualización: 28/06/2019.** La idea para hacer este shape sin islas podría parecer sencilla ahora, pero en su momento tener un shape sin islas se me hacía algo muy especial. Tener un polígono especial para cada estado, además, conlleva ciertas ventajas al hacer leaflets reactivos ante eventos en aplicaciones shiny).
