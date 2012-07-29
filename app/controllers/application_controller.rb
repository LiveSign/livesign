class ApplicationController < ActionController::Base
  protect_from_forgery

  # Retrieve a cached instance of an OpenTok SDK client or intialize a new one if we haven't already.
  # @return [OpenTok::OpenTokSDK] An OpenTokSDK instance
  def opentok
    @opentok ||= OpenTok::OpenTokSDK.new(Rails.configuration.opentok.api_key, Rails.configuration.opentok.api_secret)
  end

  # Generate a new token for a new session for OpenTok.
  # @param [Hash<Symbol>] opts A hash of options
  # @option opts [String] :metadata A string of metadata to be stored with the OpenTok session
  # @return [String] An OpenTok authentication token
  def opentok_token(opts = {})
    token_options = {
      session_id: opentok.create_session(request.remote_addr),
      role: OpenTok::RoleConstants::PUBLISHER
    }

    options[:metadata] = opts[:metadata] if opts[:metadata]

    opentok.generate_token(token_options)
  end
end
