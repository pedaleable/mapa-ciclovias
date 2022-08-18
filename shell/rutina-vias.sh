# API URL
#API_URL="https://overpass-api.de/api/interpreter"
#API_URL="https://overpass.nchc.org.tw/api/interpreter"
#API_URL="https://overpass.openstreetmap.fr/api/interpreter"
API_URL="https://overpass.kumi.systems/api/interpreter"


# ACTUALIZACIÓN CICLOVÍAS
wget -O ./datos/ciclovías/openstreetmap/datos.osm --post-file=./shell/query-overpass-vías.txt $API_URL
wait
osmtogeojson ./datos/ciclovías/openstreetmap/datos.osm > ./datos/ciclovías/openstreetmap/datos.geojson
wait
geojson-pick name highway cycleway oneway cycleway:left cycleway:right oneway:bicycle estandar:minvu route < ./datos/ciclovías/openstreetmap/datos.geojson > ./datos/ciclovías/openstreetmap/datos-limpios.geojson
wait
mv ./datos/ciclovías/openstreetmap/datos.osm ./datos/ciclovías/openstreetmap/1-originales/
mv ./datos/ciclovías/openstreetmap/datos.geojson ./datos/ciclovías/openstreetmap/2-procesados/
mv ./datos/ciclovías/openstreetmap/datos-limpios.geojson ./datos/ciclovías/openstreetmap/2-procesados/