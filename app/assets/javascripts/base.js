App = {
  set_global : function(key, value) {
    var site = this;

    var set = function() {
      site[key] = value;
    };

    set();

    if (typeof Turbolinks !== "undefined") {
      $(document).on(Turbolinks.EVENTS.BEFORE_UNLOAD, set);
    }
  },

  when_mobile: function(fn) {
    App.mobile_callbacks.push(fn);
  },

  when_desktop: function(fn) {
    App.desktop_callbacks.push(fn);
  },

  run_callbacks: function(key) {
    $.each(App[key + '_callbacks'], function(i, callback) {
      callback();
    });
  }
};

App.set_global('slide_speed', 900);
App.set_global('mobile_callbacks', []);
App.set_global('desktop_callbacks', []);

Layout = {
  Desk: {
    name: 'desktop',
    min_width: 768
  },

  Hand: {
    name: 'mobile',
    min_width: 0,
    max_width: 767
  },

  set_breakpoint : function() {
    var breakpoints = ['Hand', 'Desk'];

    this.width = $(window).width();

    for (var i=0; i < breakpoints.length; i++) {
      var breakpoint     = breakpoints[i],
          min_width      = this[breakpoint].min_width,
          max_width      = this[breakpoint].max_width,
          is_at_open_end = (i == breakpoints.length - 1 && typeof max_width == 'undefined');

      if (this.width >= min_width && (is_at_open_end || this.width <= max_width)) {
        this.breakpoint = this[breakpoint];
        return;
      }
    }
  },

  on_new_breakpoint : function() {
    var old_breakpoint = (typeof this.breakpoint != 'undefined' && this.breakpoint.name);
    this.prev_breakpoint = old_breakpoint ? this.breakpoint.name : undefined;
    this.set_breakpoint();

    if (typeof this.prev_breakpoint == 'undefined') {
      this.prev_breakpoint = this.breakpoint.name;
    }

    return old_breakpoint !== this.breakpoint.name;
  }
};

$(function() {
  setTimeout(do_resize, 1);
});

setInterval(do_resize, 500);

$(window).on('focus', do_resize);

$(document).one('ready', function(){
  $(window).resize(function() {
    clearTimeout(App.resize);
    App.resize = setTimeout(do_resize, 50);
  });
});

$(document).on('ready page:load', function () {
  set_hero_width_for_home();
  remove_on_home();

  Layout.set_breakpoint();
  App.run_callbacks(Layout.breakpoint.name);
});

function do_resize() {
  set_feature_block_height();
  set_hero_width_for_home();

  if (Layout.on_new_breakpoint()) {
    App.run_callbacks(Layout.breakpoint.name);
  }
}

function set_hero_width_for_home() {
  if ($(window).outerWidth() > 0 && $('.home').length > 0) {
    $('.hero').css({ 'width' : $(window).outerWidth() - 520 });
  }
}

function remove_on_home() {
  if (window.location.pathname != '/') {
    $('body').removeClass('on-home');
  } else {
    $('body').addClass('on-home');
  }
}

function measure_scrollbar() {
  // Shamelessly stolen: http://davidwalsh.name/detect-scrollbar-width

  // Create the measurement node
  var scrollDiv = document.createElement("div");
  scrollDiv.className = "scrollbar-measure";
  document.body.appendChild(scrollDiv);

  // Get the scrollbar width
  var scrollbarWidth = scrollDiv.offsetWidth - scrollDiv.clientWidth;

  // Delete the DIV
  document.body.removeChild(scrollDiv);

  return scrollbarWidth;
}
