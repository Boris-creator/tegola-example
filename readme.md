# tegola-example

[Tegola.io](https://tegola.io/) quickstart in a containerized environment.
Inspired by https://github.com/iwpnd/tegola-example-bonn.git repo, with using of the latest libs' versions.
The example shows how you can render any data in geojson format on the map.

We are using data from source https://github.com/simp37/Ukrainia_geoJSON. You can use any other geojson data, just put it in the `data/assets/geo.json`

## Usage


```bash
docker compose up
```

### Provider: `mvt_postgis`

Tegola requests mvt tiles from PostGIS and forwards the result.
Open file `index.html` using your favorite server or url `http://localhost/8081`.

### Clean up

```bash
docker compose down -v
```

## License

MIT


