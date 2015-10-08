$(function() {
  $( "#datepicker" ).datepicker({
    changeMonth: true,
    changeYear: true,
    yearRange: '1920:2017'
  });
});

$('#convicted_yes').on('click',function() {
  $('#incarcerated-group').removeClass('hidden');
});
//
$('#convicted_no').on('click',function() {
  $('#incarcerated-group').addClass('hidden')
  $('#date-text').text("Disposition Date:");
});
//
$('#incarcerated_yes').on('click', function(){
  $('#date-text').text("Release Date:");
});

$('#incarcerated_no').on('click', function(){
  $('#date-text').text("Disposition Date:");
});
