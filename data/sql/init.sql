CREATE TABLE IF NOT EXISTS public.rivers
(
    sample_id integer,
    wkb_geometry geometry(LineString,4326),
    name character varying COLLATE pg_catalog."default"
);
CREATE TABLE IF NOT EXISTS public.cities
(
    sample_id integer,
    wkb_geometry geometry(Polygon,4326),
    name character varying COLLATE pg_catalog."default"
);
CREATE INDEX geom_index_rivers ON rivers USING GIST (wkb_geometry);
CREATE INDEX geom_index_cities ON cities USING GIST (wkb_geometry);