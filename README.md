# Mapa ciclovías

## Qué es?

Es un mapa que muestra las ciclovías (de Santiago de Chile por ahora). Su principal propósito es facilitar los desplazamientos en bicicleta por la ciudad, sobre todo en el marco de la nueva ley de convivencia de modos. De modo complementario se representan puntos de interés en la red de ciclismo, como bicicleteros o estaciones de bicicletas públicas.

Toda la información a representar se obtiene de OpenStreetMap. 

## Instrucciones de uso

Flujo de trabajo:

- Los datos se obtienen con un script de overpass api

### Para las ciclovías:

```
[out:xml][timeout:25];

(
  // parte de la consulta para ciclovías etiquetadas en la calle
  way["cycleway"]({{bbox}});
  // parte de la consulta para ciclovías con el lado marcado
  // cycleway:left o cycleway:right
  way[~"^cycleway:.*$"~"."]({{bbox}});
  // parte de la consulta para ciclovías independientes
  way["highway"="cycleway"]({{bbox}});
  // parte de la consulta para relaciones de rutas pedaleables (que no hay en santiago realmente, excepto quizás el mapocho)
  relation["route"="bicycle"]({{bbox}});
);

// print results
out body;
>;
out skel qt;
```

#### Listado de campos relevantes:

- name
- cycleway
- cycleway:left
- cycleway:right
- oneway-bicycle
- estandar:minvu

Luego de descargar esta información y meterla en la carpeta `geodatos-osm` con el nombre `export.geojson` se puede hacer mucho más eficiente el archivo con un comando de NPM llamado `geojson-pick`.

`geojson-pick name highway cycleway oneway cycleway:left cycleway:right oneway:bicycle estandar:minvu cycleway route < export.geojson > ciclovias.geojson`

*Antes de usarlo hay que instalar el paquete de NPM llamado `geojson-pick` con el siguiente comando:*

`npm install -g geojson-pick`

### Para los puntos de interés

- `amenity=bicycle_rental` (estaciones de bicicletas públicas)
- `amenity=bicycle_parking` (estacionamientos de bicicleta)

Por simpleza, se descargan dos archivos de puntos separados.
