# Descarga datos ciclovías

## OpenStreetMap

### Requerimientos (paquetes de node)

- `osmtogeojson`
- `geojson-pick`

### Pasos

- Descargar la información de OSM de la API overpass directamente, sin usar la interfaz web (overpass turbo).

`cd datos/ciclovias/openstreetmap`

`wget -O ciclovías.osm --post-file=overpass-query.txt "https://overpass-api.de/api/interpreter"`

- Traspasar el archivo `.osm` a `.geojson`.

`osmtogeojson ciclovías.osm > ciclovías.geojson`

- Moverlos a las carpetas correspondientes

`mv ciclovías.osm 1-originales`
`mv ciclovías.geojson 2-procesados`

- Limpiar los campos innecesarios del archivo geojson (opcional, facilita análisis).

`cd 2-procesados`

`geojson-pick name highway cycleway oneway cycleway:left cycleway:right oneway:bicycle estandar:minvu route < ciclovías.geojson > ciclovías-limpias.geojson`

Para más información revisar: <http://overpass-api.de/command_line.html>

## PABLO F. LAGOS

Información descargada de:

<https://www.google.com/maps/d/viewer?mid=1dOO_kEQi6qMUjHHje0YBVLmsvKc&msa=0&hl=es&ie=UTF8&vpsrc=0&ll=-33.5073381501375%2C-70.57574614158112&spn=0.229086%2C0.411301&z=12&output=embed>

## SIEDU: Sistema de Indicadores y Estándares de Desarrollo Urbano

- Información descargada de: <http://siedu.ine.cl/descargar/descarga.html> (sección cartografía)
- El archivo original es una carpeta GDB (o geodatabase) de ArcGis, así que no puedo poner el archivo original. Cargué el GDB en QGis y exporté un archivo geopackage y uno shape.
