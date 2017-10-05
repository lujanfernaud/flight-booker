Leaflet.tile_layer = "https://api.mapbox.com/v4/" \
  "mapbox.outdoors/{z}/{x}/{y}.png?access_token=" + ENV["mapbox_access_token"]

Leaflet.attribution = '© ' \
  '<a href="https://www.mapbox.com/feedback/">Mapbox</a>' \
  ' © <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'

Leaflet.max_zoom = 2
