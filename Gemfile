source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-social-rails'
gem 'devise'
gem 'figaro' # Simple Rails app configuration
gem 'font-awesome-rails'
gem 'interactor-rails', '~> 2.0'
gem 'jquery-rails'
gem 'omniauth-facebook'
gem 'omniauth-github'
gem 'omniauth-google-oauth2'
gem 'omniauth-linkedin'
gem 'puma'
gem "pundit"
gem 'responders'

ruby '2.3.1'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # Use sqlite3 as the database for Active Recor
  gem 'capybara'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'launchy'
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-rails', '~> 0.3.2'
  gem 'rspec-rails', '~> 3.5'
  gem 'rspec-activemodel-mocks'
  gem 'rubocop'
  gem 'spinach'
  gem 'spinach-rails'
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
