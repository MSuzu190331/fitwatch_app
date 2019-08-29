$(function() {
  $(document).on('turbolinks:load',function(){
    $('.ranking-container').slick({
      accessibility: true,
      autoplay: true,
      autoplaySpeed: 2000,
      speed: 500,
      fade: false,
      infinite: true,
      slidesToShow: 3,
      slidesToScroll: 1,
      centerMode: true,
      centerPadding: '10%',
      prevArrow: '<i class="fas fa-angle-double-left"></i>',
      nextArrow: '<i class="fas fa-angle-double-right"></i>',
    });
  });
});