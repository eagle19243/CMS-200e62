class MissingPage
  attr_reader :name, :content_blocks

  def initialize name, content_blocks: []
    @name = name
    @content_blocks = content_blocks
  end

  def slug
    ''
  end
end
