function dropdownItemSelect() {
  $('.dropdown-menu').children().children().on("click", function() {
    $('.recommended').text( $(this).text() );
    console.log( $( this ).text() );
  });
}



$(document).ready(function() {
  dropdownItemSelect();
});
