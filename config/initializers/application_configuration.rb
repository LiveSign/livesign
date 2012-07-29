begin
  config = YAML.load_file Rails.root.join("config/config.yml")

  config[Rails.env].each do |k,v|
    key = k + "="
    value = if v.is_a?(Hash)
      Hashie::Mash.new(v)
    else
      v
    end

    Rails.configuration.send(key.to_sym, value)
  end

rescue Exception => e
  Rails.logger.error "Unable to load configuration variables from #{config}"
  raise e
end
