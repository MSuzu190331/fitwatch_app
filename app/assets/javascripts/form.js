$(function() {
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      console.log('ok2');
      reader.onload = function (e) {
        $("#image_prev").attr("src", e.target.result);
        console.log('ok3');
      }
      reader.readAsDataURL(input.files[0]);
      console.log('ok4');
    }
  }
  $(document).on('turbolinks:load',function(){
    $("#form_image").change(function(){
      readURL(this);
      console.log('ok1');
    });
  });
});

