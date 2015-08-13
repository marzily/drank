// var map;
// function initMap() {
//   map = new google.maps.Map(document.getElementById('map'), {
//     center: {lat: -34.397, lng: 150.644},
//     zoom: 8
//   });
//   return map;
// }
//
// // $(function() {
// $(document).ready(function() {
//   console.log("hello from map.js");
// });


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
  // var container = document.getElementById("js");
  // container.innerHTML = mapURL;
  console.log( "display map!" );
}


$(document).ready(function() {
  appendMapURL();
});
