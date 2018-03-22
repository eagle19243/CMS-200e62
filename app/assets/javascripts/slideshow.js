App.when_desktop(function () {
  $('.slideshow-block .slides').each(function () {
    $(this).slick({
      prevArrow: '<div class="slideshow-arrow prev">Previous</div>',
      nextArrow: '<div class="slideshow-arrow next">Next</div>',
      dots: true,
      swipe: false
    });
  });
});

App.when_mobile(function () {
  try {
    $('.slick-initialized').slick('destroy');
  } catch (e) {}
});
