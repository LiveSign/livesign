class Propositions::SignaturesController < ApplicationController

  def new
    @signature = Signature.new
  end

  def create
    @signature = Signature.new(params[:signature])
    if @signature.save
      # redirect_to
    else
      # render
    end
  end

  def get_petition
    @petition = Petition.find_by_slug(params[:petition_id])
  end

end
