class SitemapsController < ApplicationController
  def show
    @page = Sitemap.new
  end
end
