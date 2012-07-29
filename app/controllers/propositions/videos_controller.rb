class Propositions::VideosController < Propositions::BaseController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      #
    else
      #
    end
  end
  
end
