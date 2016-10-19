$(document).ready(function() {

  $(".guest-rsvp-checkbox").change(function() {
    console.log("click event")
    var guestRowID = "#guest-rsvp-row" + $(this).val();
    $(guestRowID).animate({'backgroundColor' : '#5cb85c'}, 'fast').animate({'backgroundColor' : ''});
  });
  
  $('.datepicker').datepicker({
    dateFormat: 'mm/dd/yyyy',
    autoclose: true
  });
  
});