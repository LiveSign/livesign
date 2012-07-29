class Propositions::BaseController < ApplicationController
  
  before_filter :get_proposition

private  
  
  def get_proposition
    @proposition = Proposition.find_by_slug(params[:proposition_id])
  end
  
  def get_user
    @user = User.find_by_id(params[:user_id])
  end

  def get_signature
    @signature = Signature.where(proposition_id: params[:proposition_id], user_id: params[:user_id], id: params[:id]).first
  end

end