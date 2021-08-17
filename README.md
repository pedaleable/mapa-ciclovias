# Mapa ciclovías

## Qué es?

Es un mapa que muestra las ciclovías (de Santiago de Chile por ahora). Su principal propósito es facilitar los desplazamientos en bicicleta por la ciudad, sobre todo en el marco de la nueva ley de convivencia de modos. De modo complementario se representan puntos de interés en la red de ciclismo, como bicicleteros o estaciones de bicicletas públicas.

Toda la información a representar se obtiene de OpenStreetMap.

## Instrucciones de uso

Ejecutar `sh shell/rutina.sh` en la carpeta raíz del repositorio.

Esto descarga los datos desde la API overpass y les hace unos procesos para eliminar información innecesaria.

Subir archivos manualmente a MAPBOX, reemplazando los tilesets:

- `pdi_limpios` con `./datos/puntos-de-interés/openstreetmap/2-procesados/datos.geojson`
- `ciclovias_limpias` con `./datos/ciclovías/openstreetmap/2-procesados/datos.geojson`

## Requerimientos

### Paquetes NPM

- osmtogeojson
- geojson-pick