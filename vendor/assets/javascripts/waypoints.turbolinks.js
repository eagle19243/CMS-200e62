(function(wp) {
  if (typeof Turbolinks !== "undefined") {
    $(document).on(Turbolinks.EVENTS.FETCH, function() {
      wp.destroyAll();
    });

    // Custom event added to turbolinks that fires when animation is complete
    $(document).on(Turbolinks.EVENTS.COMPLETE, function() {
      wp.refreshAll();
    });
  }
})(Waypoint);
