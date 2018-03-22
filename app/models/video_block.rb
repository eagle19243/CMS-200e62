class VideoBlock < ActiveRecord::Base

  belongs_to :content_block

  validates :url, :width, :height, presence: true
  validates_length_of :title, maximum: 255
  validate :is_a_vimeo_link

  before_save :set_video_id

  def vimeo_url?
    self.url.include? "vimeo.com"
  end

  def set_video_id
    self.video_id = parsed_vimeo_id if vimeo_url?
  end

  def as_json(options = {})
    options.reverse_merge! only: [:title, :caption, :url]
    super options
  end

  protected

    def parsed_vimeo_id
      self.url.split("/")[-1]
    end

    def is_a_vimeo_link
      errors.add :url, "must be from Vimeo" unless vimeo_url?
    end

end
