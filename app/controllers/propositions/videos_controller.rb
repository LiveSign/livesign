class Propositions::VideosController < Propositions::BaseController

  before_filter :get_proposition, :get_user
  before_filter :get_signature, except: :index

  def index
  end

  def new
    @client_config = { opentok_api_key: Rails.configuration.opentok.api_key }
    @client_config[:opentok_session_id] = opentok_session
    @client_config[:opentok_auth_token] = opentok_token(session_id: @client_config[:opentok_session_id])
  end

  def create
    if params[:opentok_archive_id].blank?
      flash[:error] = "Unable to save recorded video"
      redirect_to :back
    end

    @signature.opentok_archive_id = params[:opentok_archive_id]

    if @signature.save
      redirect_to proposition_videos_path(@proposition.slug)
    else
      flash[:error] = "Unable to save recorded video"
      redirect_to :back
    end
  end
  
  private
  def get_signature
    @signature = Signature.find(params[:signature_id].to_i)
  end

end
