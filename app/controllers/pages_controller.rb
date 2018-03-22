class PagesController < ApplicationController

  def show
    if params[:id].present?
      @page = Page.where(slug: params[:id]).first
    else
      @page = Page.where(slug: 'home').first
    end

    if @page.slug == 'contact'
      @registrant = Registrant.new
    elsif @page.slug == 'team'
      @team_members = TeamMember.active.positioned
    elsif @page.slug == 'availability'
      @units = Unit.active.includes(:unit_line).order('unit_lines.number_of_bedrooms, units.price, units.floor, units.letter')
    elsif @page.slug == 'press'
      @press_clippings = PressClipping.active.positioned
    elsif @page.slug == 'home'
      @fact_sheets = FactSheet.active.positioned
    end
  end

end
