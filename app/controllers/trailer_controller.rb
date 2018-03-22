class TrailerController < ApplicationController

  def show
    @page = TrailerPage.new
  end

  private

    class TrailerPage

      def slug
        "trailer"
      end

      def name
        "Exclusive Trailer"
      end
    end

end
