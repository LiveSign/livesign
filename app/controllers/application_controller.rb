class ApplicationController < ActionController::Base
  protect_from_forgery

  # Retrieve a cached instance of an OpenTok SDK client or intialize a new one if we haven't already.
  # @return [OpenTok::OpenTokSDK] An OpenTokSDK instance
  def opentok
    @opentok ||= OpenTok::OpenTokSDK.new(Rails.configuration.opentok.api_key, Rails.configuration.opentok.api_secret)
  end

  # Create a new OpenTok session via the OpenTok SDK client.
  # @return [String] An OpenTok session id
  def opentok_session
    opentok.create_session(request.remote_addr).to_s
  end

  # Generate a new token for an OpenTok session.
  # @param [Hash<Symbol>] opts A hash of options
  # @option opts [String] :metadata A string of metadata to be stored with the OpenTok session
  # @return [String] An OpenTok authentication token
  def opentok_token(opts = {})
    token_options = { role: OpenTok::RoleConstants::MODERATOR }
    token_options[:session_id] = opts[:session_id] || opentok_session
    token_options[:metadata] = opts[:metadata] if opts[:metadata]

    opentok.generate_token(token_options)
  end

  def errors_to_string(errors)
    errors.full_messages.join('.&nbsp;')
  end

end
