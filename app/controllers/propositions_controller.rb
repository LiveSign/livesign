class PropositionsController < ApplicationController

  before_filter :get_proposition, :only => [:show]

  def index
    @propositions = Proposition.paginate(:page => params[:page])
  end

  def show
    # show.html.haml
  end

private

  def get_proposition
    @proposition = Proposition.find_by_slug(params[:id])
  end

end
