source 'https://rubygems.org'

gem 'rails', '3.2.6'
gem 'mobylette'
gem 'active_model_serializers', git: 'git://github.com/josevalim/active_model_serializers.git'

gem 'jquery-rails'
gem 'jquery_mobile_rails'

gem 'twilio-ruby'
gem 'opentok'

group :production do
  gem 'pg'
end

group :development do
  gem 'sqlite3'
end

group :development, :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'factory_girl_rails'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end
