function dropdownItemSelect() {
  $('.dropdown-menu').children().children().on("click", updateRecommended);
}

function updateRecommended() {
  $('.recommended').text( $(this).text() );
  console.log( $( this ).text() );
}

// on click
//  ==> drop image
// ==> get new image url
// ==> append new image

function updateMap(position) {
  var coordinates = { latitude: position.coords.latitude,
                      longitude: position.coords.longitude };
  $.ajax({  url: "/map_coords",
            type: "POST",
            data: coordinates,
            success: function() {
                console.log(coordinates);
            },
            error: function(message){
                console.error(message);
            }
        });
}

var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 39.7514438, lng: -105.0718248},
    zoom: 14
  });
}

var map_url = "<script async defer src='https://maps.googleapis.com/maps/api/js?key=AIzaSyBD1ckF76MqtDJReVqr84PzSrR2X8gJRL8&callback=initMap'></script>"

function appendMapURL() {
  $( "html" ).append( map_url );
  console.log( "display map!" );
}

appendMapURL();
$(document).ready(function() {
  dropdownItemSelect();
});
