source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use sqlite3 as the database for Active Record
gem 'active_model_serializers', '~> 0.10.0'

gem 'devise'
gem 'mail'
gem 'httparty'
#devise gem for user authentication
gem 'simple_token_authentication', '~> 1.0' # see semver.org
gem 'faker', '~> 1.9', '>= 1.9.1'
gem 'annotate', '~> 2.7'
gem 'will_paginate', '~> 3.1.0'

gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
#gem 'wkhtmltopdf-binary-edge'
gem 'wkhtmltopdf'

#-----------------------------------
gem 'prawn'
gem 'prawn-table', '~> 0.1.0'
gem 'squid', '~> 1.2'

gem 'google-auth-token_validator'
gem "omniauth-google-oauth2", "~> 0.2.1"



# Use Puma as the app server
gem 'puma', '~> 3.11'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
 gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
 gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'


end
group :production do
  gem 'pg'
end


# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
