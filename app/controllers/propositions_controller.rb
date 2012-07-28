class PropositionsController < ApplicationController

  before_filter :get_petition, :only => [:show]

  def show
    # show.html.haml
  end

  def get_petition
    @petition = Petition.find_by_slug(params[:id])
  end

end
