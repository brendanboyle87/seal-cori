$(document).ready(function() {
  setTimeout(function(){
    $('.alert-box').fadeOut('slow', function() {
      $(this).remove();
    })
  }, 4000);
})

$('#cori-question-submit').one('click', function(e) {
      e.preventDefault();
      if (document.getElementById('yes_or_no_no').checked) {
        document.location.href = '/pages/nocori';
      }
      if (document.getElementById('yes_or_no_yes').checked) {
        $.get('/cori_questions.json', { 'yes_or_no': 'yes'}).done(function(data)
        {
            $('.question-content').attr({
              action: data['action'],
              id: data['id']
            });
            $('.question-content p').text(data['paragraph']);
            $('#cori-question-submit').attr('id', 'sex-offender-submit');
        });
      }
  });
