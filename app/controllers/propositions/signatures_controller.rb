class Propositions::SignaturesController < Propositions::BaseController

  before_filter :get_user

  def new
    @signature = Signature.new
  end

  def create
    @signature = Signature.new(user: @user, proposition: @proposition, data: params[:data])
    if @signature.save
      respond_to do |format|
        format.json { render :json, {:success => true} }
        format.html { redirect_to new_proposition_video_path(@proposition.slug, :user_id => @user, :signature_id => @signature)}
      end
    else
      respond_to do |format|
        format.json { render :json, {:success => false, :errors => @signature.errors } }
        format.html do
          flash[:error] = errors_to_string(@signature.errors)
          render :action => :new
        end
      end
    end
  end

end
