class PropositionsController < ApplicationController

  before_filter :get_proposition, :only => [:show, :signature_complete]

  def index
    @propositions = Proposition.paginate(:page => params[:page])
  end

  def show
    @proposition = Proposition.find_by_slug(params[:id]) || Proposition.find(params[:id])
  end

  def signature_complete
    #
  end

private

  def get_proposition
    @proposition = Proposition.find_by_slug(params[:id])
  end

end
