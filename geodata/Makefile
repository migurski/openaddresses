#
# Conversion scripts for Census-provided geometry files.
#
# Original data retrieved from U.S. Census boundary shapefiles.
# Conversions include reprojection to US National Atlas Equal Area, translation
# of character set from Latin-1 to UTF-8, and casting land and water areas to
# strings to overcome OGR 1.x 32 bit value clipping.
#
# References:
#	https://www.census.gov/geo/maps-data/data/tiger-cart-boundary.html
#	http://spatialreference.org/ref/epsg/us-national-atlas-equal-area/
# 	https://trac.osgeo.org/gdal/wiki/rfc31_ogr_64
#
all: cb_2013_us_county_20m-2163.shp cb_2013_us_state_20m-2163.shp cb_2013_us_nation_20m-2163.shp

cb_2013_us_county_20m-2163.shp: cb_2013_us_county_20m.shp
	env SHAPE_ENCODING="ISO-8859-1" \
	    ogr2ogr -overwrite -lco ENCODING=utf-8 -t_srs EPSG:2163 \
	    -sql 'select STATEFP, COUNTYFP, COUNTYNS, AFFGEOID, GEOID, NAME, LSAD, cast(ALAND as character(16)), cast(AWATER as character(16)) from cb_2013_us_county_20m' \
	    cb_2013_us_county_20m-2163.shp cb_2013_us_county_20m.shp

cb_2013_us_state_20m-2163.shp: cb_2013_us_state_20m.shp
	env SHAPE_ENCODING="ISO-8859-1" \
	    ogr2ogr -overwrite -lco ENCODING=utf-8 -t_srs EPSG:2163 \
	    -sql 'select STATEFP, STATENS, AFFGEOID, GEOID, STUSPS, NAME, LSAD, cast(ALAND as character(16)), cast(AWATER as character(16)) from cb_2013_us_state_20m' \
	    cb_2013_us_state_20m-2163.shp cb_2013_us_state_20m.shp

cb_2013_us_nation_20m-2163.shp: cb_2013_us_nation_20m.shp
	env SHAPE_ENCODING="ISO-8859-1" \
	    ogr2ogr -overwrite -lco ENCODING=utf-8 -t_srs EPSG:2163 \
	    -sql 'select AFFGEOID, GEOID, NAME from cb_2013_us_nation_20m' \
	    cb_2013_us_nation_20m-2163.shp cb_2013_us_nation_20m.shp
