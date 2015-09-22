function extractCoordinates() {
  if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(coords);
  } else {
      var x = document.getElementById("weather");
      x.innerHTML = "Geolocation is not supported by this browser.";
  }
}

function coords(position) {
  var coordinates = {
    latitude:  position.coords.latitude,
    longitude: position.coords.longitude
  };

  postCoords(coordinates);
}

function postCoords(coordinates) {
  $.ajax({
    url: "/coords",
    type: "POST",
    data: coordinates,
    success: function() {
       enableLogin();
       console.log(coordinates);
    },
    error: function(message){
       console.error(message);
    }
  });
}

function enableLogin() {
  $(".button_to").attr("method", "post");
}

$(document).ready(function() {
  $(".button_to").removeAttr("method");
  extractCoordinates();
});
