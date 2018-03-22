class TeamMember < ActiveRecord::Base
  include Brb::Model::Full

  has_heading 'Name', link: 'name'
  has_heading 'Position', link: 'position', default: true
  has_heading 'Active', link: 'active'

end