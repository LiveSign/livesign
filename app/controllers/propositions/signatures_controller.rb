class Propositions::SignaturesController < Propositions::BaseController

  before_filter :get_user, except: [:index, :accept, :reject]

  def new
    @signature = Signature.new
  end

  def edit
  end

  def update
  end

  def create
    @signature = Signature.where(user_id: @user.id, proposition_id: @proposition.id).first || Signature.new(user: @user, proposition: @proposition)
    @signature.data = params[:data]

    if @signature.save
      respond_to do |format|
        format.json { render :json, {:success => true} }
        format.html { redirect_to new_proposition_video_path(@proposition.slug, :user_id => @user, :signature_id => @signature)}
      end

      return
    end

    respond_to do |format|
      format.json { render :json, {:success => false, :errors => @signature.errors } }
      format.html {
        flash[:error] = errors_to_string(@signature.errors)
        render :action => :new
      }
    end
  end

  def index
    @proposition = Proposition.find_by_slug("tofu-sartorial-freegan-pitchfork-trust-fund")
    @signatures = @proposition.signatures.includes(:user)
  end

  def accept
    @signature = Signature.find(params[:id])
    @signature.verified = true

    if @signature.save
      flash[:notice] = "Signature has been approved"
    end

    resond_with(@signature, location: signatures_path)
  end

  def reject
    @signature = Signature.find(params[:id])
    @signature.verified = false

    if @signature.save
      flash[:notice] = "Signature has been rejected"
    end

    resond_with(@signature, location: signatures_path)
  end
end
