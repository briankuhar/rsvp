$(document).ready(function(){
  $("#addNewGuest").click(function(){
    $("#guests").append($("#new_guest").html());
  });
});

