function dropdownItemSelect() {
  $('.dropdown-menu').children().children().on("click", updateRecommended);
}

function updateRecommended() {
  var drink_type = { drink_type: $(this).text() };
  $.ajax({  url: "/drink",
            type: "POST",
            data: drink_type,
            error: function(message) {
                console.error(message);
            }
        });
  $('#recommended').text(drink_type['drink_type']);
}

$(document).ready(function() {
  dropdownItemSelect();
});
