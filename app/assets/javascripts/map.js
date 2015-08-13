var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 39.7514438, lng: -105.0718248},
    zoom: 14
  });
}

var mapURL = "<script async defer
  src='https://maps.googleapis.com/maps/api/js?key=AIzaSyBD1ckF76MqtDJReVqr84PzSrR2X8gJRL8&callback='" + initMap + ">
  </script>"

function appendMapURL() {
  $( "#map" ).append( mapURL );
  console.log( "display map!" );
}


$(document).ready(function() {
  appendMapURL();
});
