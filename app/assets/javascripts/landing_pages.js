// function extractCoordinates() {
//   if (navigator.geolocation) {
//       navigator.geolocation.getCurrentPosition(coords)
//   } else {
//       var x = document.getElementById("weather");
//       x.innerHTML = "Geolocation is not supported by this browser.";
//   }
// }
//
// function coords(position) {
//   var coordinates = {
//                       latitude: position.coords.latitude,
//                       longitude: position.coords.longitude
//                     };
//   $.ajax({
//     url: "/map",
//     type: "POST",
//     data: coordinates,
//     success: function(data) {
//         alert(data);
//     },
//     error: function(data){
//         alert("fail");
//         console.log(data);
//     }
//   });
//   // $.post('/map', coordinates);
// }
//
// extractCoordinates();
// // $(document).ready(function() {
// // });
