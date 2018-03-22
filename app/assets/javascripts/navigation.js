$(function() {
  $('.initial.navigation').waypoint(function(direction) {
    toggle_nav(direction === 'down');
  });

  $('.page-menu').click(function(event) {
    var offset_y = $(window).scrollTop();

    if (offset_y == 0 && $(window).outerWidth() < 768) {
      $('.sticky-header').toggleClass('show');
    }

    toggle_sticky_nav();
  });

  $('.jump-link').click(function(event) {
    event.preventDefault();
    var destination = $(this).attr('href'),
        offset_y    = $(destination).offset().top - 88;

    $('html, body').animate({ 'scrollTop': offset_y });
  });
});

$(document).one('ready', function() {
  if (typeof Turbolinks !== "undefined") {
    $(document).on(Turbolinks.EVENTS.FETCH, function() {
      toggle_sticky_nav(false);
      toggle_nav(false);
    });
  }

  $(window).scroll(function() {
    var scroll_position = $(window).scrollTop(),
        window_height   = $(window).height(),
        document_height = $(document).height();
        short_content   = window_height === document_height;
        end_of_document = (scroll_position + window_height) >= document_height;
        transitioning   = (typeof Turbolinks !== 'undefined') && Turbolinks.isTransitioning();

     if(!short_content && end_of_document && !transitioning) {
       toggle_sticky_nav(true);
     } else {
       reset_sticky_nav();
     }
  });
});

function toggle_nav(display) {
  if (typeof display === 'undefined') {
    $('.page-menu').toggleClass('show');
    $('.sticky-header').toggleClass('show');
    $('.initial.navigation').toggleClass('show');
  } else {
    $('.page-menu').toggleClass('show', display);
    $('.sticky-header').toggleClass('show', display);
    $('.initial.navigation').toggleClass('show', !display);
  }
}

function toggle_sticky_nav(display) {
  if (typeof display === 'undefined') {
    $('.page-menu').toggleClass('show');
    $('.sticky-header .navigation').toggleClass('show');
  } else {
    $('.page-menu').toggleClass('show', !display);
    $('.sticky-header .navigation').toggleClass('show', display);
  }
}

function reset_sticky_nav() {
  var $navigation = $('.initial.navigation');

  if ($navigation.length > 0) {
    var offset = $navigation.offset().top;

    if (offset === 20 && $('.sticky-header .navigation.show')[0] != undefined) {
      $('.sticky-header .navigation').toggleClass('show');
      $('.page-menu').toggleClass('show');
    }
  }
}
