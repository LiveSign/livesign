if File.exist? Rails.root.join("config/config.yml")
  config = YAML.load_file Rails.root.join("config/config.yml")
else
  raise "Unable to load configuration variables from #{config}"
end

# For each environment, find all keys and assign them to Rails configuration methods.
# Hashes are converted in Hashe::Mash instances to allow for indifferent access; ie:
# config[:key], config["key"], or config.key
config[Rails.env].each do |k,v|
  key = k + "="
  value = if v.is_a?(Hash)
    Hashie::Mash.new(v)
  else
    v
  end

  Rails.configuration.send(key.to_sym=, value)
end