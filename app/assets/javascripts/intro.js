$(function(){
  if (typeof Turbolinks !== 'undefined') {
    $(document).on('click', 'a', function(e) {
      if (Turbolinks.isTransitioning()) {
        e.preventDefault();
      };
    });
  }
});
