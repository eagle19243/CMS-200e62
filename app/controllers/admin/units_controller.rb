class Admin::UnitsController < Admin::ApplicationController
  include Admin::Concerns::PermitParams

  private

  def unit_params
    params.require(:unit)
          .permit(:floor,
                  :letter,
                  :number_of_bedrooms,
                  :number_of_bathrooms,
                  :price,
                  :monthly_taxes,
                  :monthly_common_charges,
                  :status,
                  :active,
                  :interior_square_feet,
                  :exterior_square_feet,
                  :interior_square_meters,
                  :exterior_square_meters,
                  :unit_line_id,
                  content_block_params,
                  standalone_images_params,
                  renderings_attributes: [image_params],
          )
  end
end
