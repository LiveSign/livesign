class Propositions::VideosController < Propositions::BaseController

  before_filter :get_proposition, :get_user
  before_filter :get_signature, except: :index
  before_filter :get_client_config, :only => [:new]

  def new
    #
  end

  def create
    if params[:opentok_archive_id].present? && @signature.update_attribute(:opentok_archive_id, params[:opentok_archive_id])
      redirect_to signature_complete_proposition_path(@proposition.slug)
    else
      get_client_config
      flash[:error] = "Unable to save recorded video"
      render :action => :new
    end
  end
  
private

  def get_client_config
    @client_config = { opentok_api_key: Rails.configuration.opentok.api_key }
    @client_config[:opentok_session_id] = opentok_session
    @client_config[:opentok_auth_token] = opentok_token(session_id: @client_config[:opentok_session_id])
  end

  def get_signature
    @signature = Signature.find(params[:signature_id].to_i)
  end

end
