(function (v) {
  var LinkComponent = v.extend(v.getComponent('Component'), {
    constructor: function(player, text, url, attrs) {
      v.getComponent('Component').call(this, player);

      this.addClass('vjs-link')

      $(this.el()).append(this.createLink(text, url, attrs));
      $(this.el()).off('click');
    },

    createLink: function(text, url, attrs) {
      var link = $('<a>');

      attrs = (typeof attrs == 'undefined' ? {} : attrs);

      link.text(text);
      link.attr('href', url);
      link.attr('data-no-turbolink', true);
      link.attr(attrs);

      return link;
    }
  });

  var ShareComponent = v.extend(v.getComponent('MenuButton'), {
    constructor: function() {
      v.getComponent('MenuButton').call(this, v);

      // Clear events added by video.js, leaving jQuery bound events
      var menu = $(this.$('.vjs-menu'));
      var clone = menu.clone(true, true);
      menu.replaceWith(clone);

      this.addClass('vjs-share');
    },

    handleClick: function () {
      this.toggleClass('is-showing-options');
    },

    createItems: function () {
      var smsLink = 'sms:' + encodeURIComponent(window.location.href);
      var facebookLink = 'https://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(window.location.href)
      var emailLink = 'mailto:?body=' + encodeURIComponent(window.location.href);

      return [
        // new LinkComponent(this.player_, 'SMS', smsLink),
        new LinkComponent(this.player_, 'Facebook', facebookLink, { target: "_blank" }),
        new LinkComponent(this.player_, 'Email', emailLink)
      ]
    }
  });

  var CustomControlBar = v.extend(v.getComponent('ControlBar'), {});

  CustomControlBar.prototype.options_.children = [
    "playToggle",
    "volumeMenuButton",
    "customControlSpacer",
    "currentTimeDisplay",
    "timeDivider",
    "durationDisplay",
    "customControlSpacer",
    "shareComponent",
    "fullscreenToggle",
    "progressControl"
  ]

  v.registerComponent('ShareComponent', ShareComponent)
  v.registerComponent('ControlBar', CustomControlBar)
})(videojs);
