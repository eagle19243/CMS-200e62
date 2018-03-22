module ContentBlocksHelper

  def css_class(cb)
    cb.class.to_s.underscore.dasherize
  end

  def large_text?(cb)
    if cb.is_a?(TextBlock) && cb.large?
      'large'
    end
  end

  def css_id(cb, selector = '')
    "#{selector}#{css_class(cb)}-#{cb.id}"
  end

  def css_lightbox_id(cb)
    "lightbox-#{css_id(cb)}"
  end

  def image_block_index(cb)
    @img_index ||= 0
    if cb.block_type == 'ImageBlock'
      @img_index += 1
    end
  end

  def sequenced_content_blocks(content_blocks)
    section_blocks = content_blocks.select {|cb| cb.block_type == 'SectionBlock'}

    content_blocks.each_with_object([]) do |block, sequence|
      if block.block_type == 'SectionBlock'
        previous = sequence.select {|cb| cb.is_a?(ContentBlock) && cb.block_type == 'SectionBlock'}
        sequence << jump_links(section_blocks, previous: previous)
      end
      sequence << block
    end
  end

  def jump_links(section_content_blocks, current: nil, previous: [])
    section_content_blocks.map do |content_block|
      [
        content_block.section_block.title,
        content_block.section_block.id,
        { class: (previous.include?(content_block) ? 'previous' : 'upcoming' )}
      ]
    end
  end

end
