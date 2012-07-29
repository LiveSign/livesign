class Propositions::BaseController < ApplicationController
  
  before_filter :get_proposition

private  
  
  def get_proposition
    @proposition = Proposition.find_by_slug(params[:proposition_id])
  end
  
end