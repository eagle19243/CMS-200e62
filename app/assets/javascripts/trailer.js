$(function () {
  var $body = $('body');
  var $window = $(window);

  var videoRatio = 1920 / 1080; // 1080p

  var setBodyMaxWidthByHeight = function () {
    $body.css({
      maxWidth: Math.max(450, ($window.height() * videoRatio) - 200)
    })
  };

  if ($body.hasClass('trailer')) {
    console.log('here');
    $window.on('resize', setBodyMaxWidthByHeight);

    setBodyMaxWidthByHeight();
  }

  $('.video-js').each(function () {
    var $video = $(this).closest(".video-block__player");
    var video = videojs(this);

    var setVideoMaxWidthByHeight = function () {
      var maxWidth = Math.max(450, ($window.height() * videoRatio) - 400);

      $video.css({
        maxWidth: maxWidth
      })
    };

    $window.on('resize.video', setVideoMaxWidthByHeight);

    setVideoMaxWidthByHeight();

    $(document).one(Turbolinks.EVENTS.BEFORE_UNLOAD, function () {
      video.dispose();
      $window.off('resize.video', setVideoMaxWidthByHeight);
    });
  });

});
