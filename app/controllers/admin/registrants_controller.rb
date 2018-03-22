class Admin::RegistrantsController < Admin::ApplicationController
  include Admin::Concerns::PermitParams

  def download
    @registrants = Registrant.order(created_at: :desc)
    respond_to do |format|
      format.html
      format.csv { send_data @registrants.to_csv, { filename: '200e62-registrants.csv' } }
    end
  end

  private

  def registrant_params
    params.require(:registrant).permit(
      :registrant_type,
      :name,
      :email,
      :phone,
      :country,
      :is_a_broker,
      :referrer,
      :residence_size,
      :comments,
      content_block_params
    )
  end

end