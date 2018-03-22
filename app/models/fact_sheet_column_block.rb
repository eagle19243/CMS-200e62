class FactSheetColumnBlock < ActiveRecord::Base
  include Concerns::HasImage

  belongs_to :content_block

  has_image :image
end
