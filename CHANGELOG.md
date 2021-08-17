# Santiago pedaleable, versión 0.3

Rediseño completo, porque las herramientas con las que se construyeron las versiones anteriores ya están obsoletas.

## Sistema anterior (v0.2)

Flujo de trabajo:

- Datos se obtienen con un script de overpass api
- Se les da una apariencia personalizada en tilemill
- Se crea una capa de mosaicos raster que abarca solamente a Santiago

Características_

- Hay que actualizar a mano
- Tilemill ya no funciona bien en OSX 10.11
- Es muy difícil de replicar
- No es escalable (no funciona bien para varias ciudades)

## Propuesta para esta versión (v0.3)

Flujo de trabajo

- Datos se obtienen con overpass api
- Se añaden a un mapa como una capa geojson directamente
- Líneas se dibujan en color verde, sin distinciones de tipo o sentido

Características:

- Se mantiene la necesidad de actualizar a mano, pero es un proceso más sencillo.
- No requiere de ningún software para procesar los datos. Se puede actualizar desde cualquier computador con internet.
- Permite algo más de escalabilidad.
- Usa mapbox.js, más compatible y ya sé cómo ocuparlo (algo).

## Propuesta para la versión 0.4

El elementos más importante es lograr que la capa se actualice sola. Para esto hay distintas alternativas:

- Pasarse a mapbox GL
- Con mapbox.js, ocupar el overpass api directo para solicitar los datos en tiempo real.
