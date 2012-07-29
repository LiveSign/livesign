class PagesController < ApplicationController

  def terms_of_service
    @proposition = Proposition.find_by_slug(params[:proposition])
  end

  def contact_us
  end

end
