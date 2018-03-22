class Unit < ActiveRecord::Base
  include Brb::Model::Full
  include Concerns::ElasticSearchable
  include AASM

  validates_presence_of :floor, :letter

  has_heading 'Number', link: 'floor', display: 'number', default: true
  has_heading 'Price', link: 'price'
  has_heading 'Active', link: 'active'

  belongs_to :unit_line

  has_image :floor_plan_pdf
  has_images :floor_plans
  has_images :renderings

  aasm column: :status do
    state :available, initial: :true
    state :not_available
    state :contract_pending
    state :contract_signed
    state :sold
  end
  
  searches :floor, :letter, :status, methods: [:name, :humanized_status]

  def name
    "#{floor}#{letter}"
  end

  def humanized_status
    # Pulls "translated" values from en.yml locale
    aasm.human_state
  end

  def area
    @area ||= Area.new(self)
  end

  def number
    floor.to_s + letter
  end

  def number=(value)
    floor, letter = value.split(//, 2)
  end

  def price
    Money.new super
  end

  def monthly_common_charges
    Money.new super
  end

  def monthly_taxes
    Money.new super
  end

  def show_floor_plan_pdf?
    floor_plans.present? && floor_plan_pdf.present? && floor_plan_pdf.attachment_url.present?
  end

end
