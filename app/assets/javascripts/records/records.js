$(function() {
  $( "#datepicker" ).datepicker({
    changeMonth: true,
    changeYear: true,
    yearRange: '1920-2017'
  });
});

$('#convicted_true').on('click',function() {
  $('#incarcerated-group').removeClass('hidden');
  $('.date-group').addClass('hidden');
});

$('#convicted_false').on('click',function() {
  $('.date-group').removeClass('hidden');
  $('#incarcerated-group').addClass('hidden')
});

$('#incarcerated_yes').on('click', function(){
  $('.date-group').removeClass('hidden');
  $('#date-text').text("Release Date:");
});

$('#incarcerated_no').on('click', function(){
  $('.date-group').removeClass('hidden');
  $('#date-text').text("Disposition Date:");
});
