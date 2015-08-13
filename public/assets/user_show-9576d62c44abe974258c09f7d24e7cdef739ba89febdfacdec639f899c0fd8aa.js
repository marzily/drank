// dropdown menu
function dropdownItemSelect() {
  $('.dropdown-menu').children().children().on("click", updateRecommended);
}

function updateRecommended() {
  var drink_type = {drink_type: $(this).text()};
  $.ajax({  url: "/drink_type",
            type: "POST",
            data: drink_type,
            success: function() {
                console.log(drink_type);
            },
            error: function(message){
                console.error(message);
            }
        });
  $('.recommended').text(drink_type['drink_type']);
}

var restaurantList;
function restaurants() {
  restaurantList = $('#restaurants').data('restaurants');
  return restaurantList;
}

// on click
//  ==> drop image
// ==> get new image url
// ==> append new image

// map
function coordinates() {
  return { lat: $('#coordinates').data('lat'),
           lng: $('#coordinates').data('lng') };
}

function initMap() {
  var map = new google.maps.Map(document.getElementById('map'), {
    center: coordinates(),
    zoom: 14
  });

// var restaurantHash = restaurantList[0]['hash']
//
// var contentString =
//       '<div class="restaurant">' +
//       '<h5><a href=' + restaurantHash['url'] + '>' + restaurantHash['name'] + '</a></h5>' +
//       '<p>' + restaurantHash['location']['display_address'][0] + '</p>' +
//       '<p>' + restaurantHash['location']['display_address'][1] + '</p>' +
//       '<ul>' +
//       '<li><img src=' + restaurantHash['rating_img_url'] + '></li>' +
//       '<li> ' + restaurantHash['review_count'] + ' reviews' + '</li>' +
//       '</ul>' +
//       '</div>';
//
//   var infowindow = new google.maps.InfoWindow({
//     content: contentString
//   });
//
//   var marker = new google.maps.Marker({
//     position: coordinates(),
//     map: map,
//     title: restaurantList[0]['hash']['name']
//   });
//   marker.addListener('click', function() {
//     infowindow.open(map, marker);
//   });

//
// propNames.forEach(function(name) {
//     var desc = Object.getOwnPropertyDescriptor(o, name);
//     Object.defineProperty(copy, name, desc);
//   });


  restaurants().forEach(function(restaurant) {
    var restaurantHash = restaurant['hash'];
    var restaurantNameTag = restaurantHash['name'].split(' ').join('');

    var contentString =
      '<div class="restaurant">' +
      '<h5><a href=' + restaurantHash['url'] + '>' + restaurantHash['name'] + '</a></h5>' +
      '<p>' + restaurantHash['location']['display_address'][0] + '</p>' +
      '<p>' + restaurantHash['location']['display_address'][1] + '</p>' +
      '<ul>' +
      '<li><img src=' + restaurantHash['rating_img_url'] + '></li>' +
      '<li> ' + restaurantHash['review_count'] + ' reviews' + '</li>' +
      '</ul>' +
      '</div>';

    eval("infowindow-" + restaurantNameTag + " = " + "new google.maps.InfoWindow({ content: contentString })");

    var rest_coord = {
      lat: restaurantHash['location']['coordinate']['latitude'],
      lng: restaurantHash['location']['coordinate']['longitude']
    };

    eval("marker-" + restaurantNameTag + "=" + "new google.maps.Marker({" +
      "position: rest_coord," +
      "map: map," +
      "title: restaurantNameTag" +
    "})");

    eval("marker-" + restaurantNameTag).addListener('click', function() {
         eval("infowindow-" + restaurantNameTag).open(map, eval("marker-" + restaurantNameTag));
     });
  });

}

function appendMapURL() {
  var mapURL = "<script async defer src='https://maps.googleapis.com/maps/api/js?key=AIzaSyBD1ckF76MqtDJReVqr84PzSrR2X8gJRL8&callback=initMap'></script>"
  $( "html" ).append( mapURL );
}

$(document).ready(function() {
  dropdownItemSelect();
  appendMapURL();
});
