CREATE TYPE raw_data AS (
  sample_id integer, wkb_geometry json, 
  name character varying
);

DROP 
  TABLE IF EXISTS cities_geojson;
CREATE TEMPORARY TABLE cities_geojson (geo json);

\COPY cities_geojson FROM './data/assets/geo.json';

MERGE INTO cities USING (
  SELECT 
    wkb_geometry, 
    name, 
    sample_id 
  FROM 
    json_populate_recordset(
      null :: raw_data, 
      (
        SELECT 
          geo 
        FROM 
          cities_geojson
      )
    )
) AS s ON s.sample_id = cities.sample_id WHEN NOT MATCHED THEN INSERT (sample_id, wkb_geometry, name) 
VALUES 
  (
    s.sample_id, 
    (
      ST_GeomFromGeoJSON(s.wkb_geometry)
    ), 
    s.name
  );
