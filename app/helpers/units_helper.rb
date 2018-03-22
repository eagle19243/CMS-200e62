module UnitsHelper

  def link_to_floor_plan label, unit, options = {}
    options.reverse_merge! target: '_blank'
    link_to label, unit.unit_line.floor_plan_pdf.attachment_url, options
  end

end
