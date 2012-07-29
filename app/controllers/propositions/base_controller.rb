class Propositions::BaseController < ApplicationController
  
  before_filter :get_petition

private  
  
  def get_petition
    @petition = Petition.find_by_slug(params[:petition_id])
  end
  
end