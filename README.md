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
script para obtener las ciclovías. Hecho por Ignacio Abé, con la ayuda del asistente de overpass turbo
*/
[out:json][timeout:25];
// gather results
(
  // query part for: “cycleway=lane”
  way["cycleway"="lane"]({{bbox}});
  relation["cycleway"="lane"]({{bbox}});

  // query part for: “cycleway=track”
  way["cycleway"="track"]({{bbox}});
  relation["cycleway"="track"]({{bbox}});

  // query part for: “highway=cycleway”
  way["highway"="cycleway"]({{bbox}});
  relation["highway"="cycleway"]({{bbox}});

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
