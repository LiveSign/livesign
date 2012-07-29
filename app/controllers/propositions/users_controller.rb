class Propositions::UsersController < Propositions::BaseController

  before_filter :get_user, :only => [:edit, :update]

  def new
    @user = User.new
  end
  
  def edit
    # edit.html.erb
  end

  def update
    if @user.update_attributes(params[:user])
     respond_to do |format|
        format.json { render :json, {:success => true} }
        format.html { redirect_to new_proposition_signature_path(@proposition.slug, :user_id => @user)}
      end
    else
      respond_to do |format|
        format.json { render :json, {:success => false, :errors => @user.errors } }
        format.html do
          flash[:error] = errors_to_string(@user.errors)
          render :action => :edit
        end
      end
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id

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

private

  def get_user
    @user = User.find_by_id(params[:id])
  end

end
