class SectionBlock < ActiveRecord::Base
  include Concerns::Sluggable

  belongs_to :content_block

  validates_presence_of :title

  sluggable :title

end