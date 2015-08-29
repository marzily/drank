// lat, lng
function coords() {
  return { lat: $('#coordinates').data('lat'),
           lng: $('#coordinates').data('lng') };
}

// city, state
var city;
var state;
function findCityState(address_obj) {
  for (var prop in address_obj) {
    if (prop === 'types') {
      if (address_obj[prop].indexOf('locality') !== -1) {
        city = address_obj['long_name'];
      } else if (address_obj[prop].indexOf('administrative_area_level_1') !== -1) {
        state = address_obj['short_name'];
      }
    }
  }
}

function postCityState() {
  $.ajax({ url: "/city_state",
           type: "POST",
           data: { city: city,
                   state: state },
           error: function(message) {
              console.error(message);
           }
         });
}

// load details to user dash
function loadDeets(components) {
  components.forEach(findCityState);
  postCityState();
  currentConditions();
}

// user pin
function selfLocation(results, status, coordinates, map) {
  if (status === 'OK') {
    var marker = new google.maps.Marker({
      position: coordinates,
      map: map,
      icon: 'https://maps.google.com/mapfiles/ms/icons/yellow-dot.png'
    });

    var components = results[1]['address_components'];
    loadDeets(components);
  }
}

var restaurantList;
function restaurants() {
  restaurantList = $('#restaurants').data('restaurants');
  return restaurantList;
}

// map
function initMap() {
  var coordinates = coords();
  var map = new google.maps.Map(document.getElementById('map'), {
    center: coordinates,
    zoom: 14
  });

  var geocoder = new google.maps.Geocoder;
  geocoder.geocode({'location': coordinates}, function(results, status) {
    selfLocation(results, status, coordinates, map);
  });

  // restaurants().forEach(function (restaurant) {
  //   var restaurantHash = restaurant['hash'];
  //
  //   var contentString =
  //     '<div class="restaurant">' +
  //     '<h5><a href=' + restaurantHash['url'] + '>' + restaurantHash['name'] + '</a></h5>' +
  //     '<p>' + restaurantHash['location']['display_address'][0] + '</p>' +
  //     '<p>' + restaurantHash['location']['display_address'][1] + '</p>' +
  //     '<ul>' +
  //     '<li><img src=' + restaurantHash['rating_img_url'] + '></li>' +
  //     '<li> ' + restaurantHash['review_count'] + ' reviews' + '</li>' +
  //     '</ul>' +
  //     '</div>';
  //
  //   eval("infowindow" + restaurantList.indexOf(restaurant) + " = " + "new google.maps.InfoWindow({ content: contentString })");
  //
  //   var rest_coord = {
  //     lat: restaurantHash['location']['coordinate']['latitude'],
  //     lng: restaurantHash['location']['coordinate']['longitude']
  //   };
  //
  //   eval("marker" + restaurantList.indexOf(restaurant) + "=" + "new google.maps.Marker({" +
  //     "position: rest_coord," +
  //     "map: map," +
  //     "title: restaurantHash['name']" +
  //   "})");
  //
  //   eval("marker" + restaurantList.indexOf(restaurant)).addListener('click', function() {
  //        eval("infowindow" + restaurantList.indexOf(restaurant)).open(map, eval("marker" + restaurantList.indexOf(restaurant)));
  //    });
  // });
}


function cityLookUp(cityName) {
  if (cityName.indexOf(" ") !== -1) {
    return cityName.replace(" ", "_");
  }
  return cityName;
}

// post current temp
function temp(parsed_json) {
  var temp_f = parsed_json['current_observation']['temp_f'];
  $.ajax({ url: "/current_conditions",
           type: "POST",
           data: { temp_f: temp_f },
           error: function(message) {
              console.error(message);
           }
         });
}

// weather
function currentConditions() {
  $.ajax({
    url: "https://api.wunderground.com/api/20e32ff3e81ba1e5/geolookup/conditions/q/" + state + "/" + cityLookUp(city) + ".json",
    dataType: "jsonp",
    success: temp
  });
}

// dropdown menu
function dropdownItemSelect() {
debugger
  $('.dropdown-menu').children().children().on("click", function() {
    console.log(this);
  });
  // updateRecommended);
}

function updateRecommended() {
  var drink_type = { drink_type: $(this).text() };
  $.ajax({  url: "/drink_type",
            type: "POST",
            data: drink_type,
            success: console.log(drink_type),
            error: function(message){
                console.error(message);
            }
        });
  $('.recommended').text(drink_type['drink_type']);
}

$(document).ready(function() {
  coords();
  debugger
  dropdownItemSelect();
});
