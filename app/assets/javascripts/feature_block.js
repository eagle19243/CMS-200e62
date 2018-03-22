$(function() {
  set_feature_block_height();
});

function set_feature_block_height() {
  var $feature_block    = $('.feature-block'),
      $feature_image    = $feature_block.children('.image');
      $jump_links_block = $('.jump-links-block');

  if ($feature_block.length && $jump_links_block.length) {
    var window_height        = $(window).height(),
        content_offset       = parseInt($('.content-to-replace').css('top')) || 0
        feature_block_offset = $feature_block.offset().top - content_offset,
        jump_links_height    = $jump_links_block.outerHeight(true),
        feature_image_height = window_height - feature_block_offset - jump_links_height;
        minimum_reveal       = Math.min(50, window_height * 0.1);

    $feature_image.css({ 'height': feature_image_height - minimum_reveal });
  }
}
