class Propositions::VideosController < Propositions::BaseController

  before_filter :get_proposition, :get_user, :get_signature

  def new
    @client_config = { opentok_api_key: Rails.configuration.opentok.api_key }
    @client_config[:opentok_session_id] = opentok_session
    @client_config[:opentok_auth_token] = opentok_token(session_id: @client_config[:opentok_session_id])
  end
  
  def create
  end
  
end
