class Propositions::UsersController < Propositions::BaseController

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      respond_to do |format|
        format.json { render :json, {:success => true} }
        format.html { redirect_to new_proposition_signature_path(@proposition.slug, :user_id => @user)}
      end
    else
      respond_to do |format|
        format.json { render :json, {:success => false, :errors => @user.errors } }
        format.html do
          flash[:error] = errors_to_string(@user.errors)
          render :action => :new
        end
      end
    end
  end

end
