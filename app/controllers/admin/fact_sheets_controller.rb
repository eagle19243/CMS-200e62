class Admin::FactSheetsController < Admin::ApplicationController
  include Admin::Concerns::PermitParams

  private

  def fact_sheet_params
    params.require(:fact_sheet)
          .permit(:introduction,
                  :position,
                  :active,
                  :language,
                  :translated_language,
                  content_block_params,
                  pdf_attributes: [
                    image_params
                  ])
  end
end
