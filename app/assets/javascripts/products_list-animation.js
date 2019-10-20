$(document).on('turbolinks:load',function(){
  
  if($(this).length){
    $(".item-container").each(function(i) {
      setTimeout(function() {
          $(".item-container").eq(i).addClass("active");
      }, 100 * i);
    });
  }

});
