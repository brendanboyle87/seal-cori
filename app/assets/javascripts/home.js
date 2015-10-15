$(document).ready(function() {
  setTimeout(function(){
    $(".alert-box").fadeOut("slow", function() {
      $(this).remove();
    })
  }, 4600);
})
