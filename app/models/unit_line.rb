class UnitLine < ActiveRecord::Base
  include Brb::Model::Full
  include AASM

  has_heading 'Name', link: 'name', default: true

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

  def humanized_status
    # Pulls "translated" values from en.yml locale
    aasm.human_state
  end

  def area
    @area ||= Area.new(self)
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
