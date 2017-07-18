# Santiago pedaleable

## Qué es?

Es un mapa que resalta la infraestructura para ciclistas por sobre el resto de la información.

Se centra en las ciclovías, las estaciones de bicicletas públicas y los estacionamientos de bicicletas. Como complemento aparecen las tiendas y talleres de bicicletas.

Toda la información a representar se obtiene de OpenStreetMap.  

## Instrucciones de uso

Flujo de trabajo:

- Datos se obtienen con un script de overpass api

### Para las ciclovías:

Pueden ir etiquetadas en las calles:

`highway=() + cycleway=lane` (sin segregación física)
`highway=() + cycleway=track` (con segregación física)

O dibujadas de modo autónomo:

`highway=cycleway`

Se pueden descargar estos tres tipos con el siguiente script de overpass turbo

```
/*
Script eficiente para obtener las ciclovías. Hecho por Ignacio Abé, con la ayuda del asistente de overpass turbo.
Ojo que no existan boludeces como cycleway=no.
*/

[out:json][timeout:25];
// gather results
(
//script eficiente que toma todas las ciclovías
//ojo que no existan boludeces como cycleway=no
  way["cycleway"]({{bbox}});
  way["highway"="cycleway"]({{bbox}});
);
// print results
out body;
>;
out skel qt;
```

### Para los puntos de interés

`amenity=bicycle_rental` (estaciones de bicicletas públicas)
`amenity=bicycle_parking` (estacionamientos de bicicleta)
`shop=bicycle` (talleres y/o tiendas de bicicleta)

Por simpleza, se descargan tres archivos de puntos separados

eof
