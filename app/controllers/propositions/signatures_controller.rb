class Propositions::SignaturesController < Propositions::BaseController

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

end
