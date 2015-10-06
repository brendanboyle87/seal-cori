$('#question_one_submit').on('click', function(e) {
      e.preventDefault();

      if (document.getElementById("yes_or_no_no").checked) {
        document.location.href = '/pages/nocori';
      }
      if (document.getElementById("yes_or_no_yes").checked) {
        debugger;
        $(".question_one").hide();
        console.log("hidden");
      }
  });
