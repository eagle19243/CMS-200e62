class Admin::TeamMembersController < Admin::ApplicationController
  include Admin::Concerns::PermitParams

  private

    def team_member_params
      params.require(:team_member).permit(
        :name,
        :bio,
        :position,
        :active
      )
    end
end