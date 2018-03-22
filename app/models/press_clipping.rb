class PressClipping < ActiveRecord::Base
  include Brb::Model::Full

  validates_presence_of :source, :blurb

  has_heading 'Source', link: 'source'
  has_heading 'Blurb', link: 'blurb'
  has_heading 'Position', link: 'position', default: true
  has_heading 'Active', link: 'active'

  has_image
  has_image :pdf

  def source_url
    pdf.present? && pdf.attachment_url.present? ? pdf.attachment_url : url
  end

end
