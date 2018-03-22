$(function () {
  $above = $(".home__above-the-fold");
  $below = $(".home__below-the-fold");

  if ($above.length && $below.length) {
    var repositionBelow = function () {
      $below.css({
        marginTop: Math.max(0, ($(window).height() - $above.height()))
      });
    }

    repositionBelow();
    $(window).on("resize", repositionBelow);
  }
});
