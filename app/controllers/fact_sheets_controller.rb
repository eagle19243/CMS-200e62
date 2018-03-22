class FactSheetsController < ApplicationController
  def show
    @fact_sheet = FactSheet.from_param params[:id]
    @page = MissingPage.new 'Fact Sheets', content_blocks: @fact_sheet.content_blocks
  end
end
