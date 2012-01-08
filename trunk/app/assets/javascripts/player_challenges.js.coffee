# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

square = (x) -> x * x

window.map_initialize = () ->
  myOptions =
    center: new google.maps.LatLng(-34.397, 150.644)
    zoom: 8
    mapTypeId: google.maps.MapTypeId.ROADMAP
  window.map = new google.maps.Map(document.getElementById("map_canvas"), myOptions)
  google.maps.event.addListener(map, 'click', (event) -> placeMarker(event.latLng))

placeMarker = (location) ->
  args = 
    position: location
    map: window.map
  document.getElementById("player_challenge_longitude").value = location.lng()
  document.getElementById("player_challenge_latitude").value = location.lat()
  marker = new google.maps.Marker(args)
  window.map.setCenter(location)

loadScript = () ->
  script = document.createElement("script");
  script.type = "text/javascript";
  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyDQ8EYgHvMnADIc2Tu-v3MtJlUbjHieNvk&sensor=true&callback=map_initialize";
  document.body.appendChild(script);

window.onload = loadScript

