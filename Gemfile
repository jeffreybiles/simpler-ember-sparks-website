source 'https://rubygems.org'
ruby '2.4.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.11.1'

gem 'activeadmin', '~> 1.0.0'
gem 'devise'
# Use sqlite3 as the database for Active Record
gem 'pg', '~> 0.17.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
gem 'bootstrap-sass', '~> 3.3.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

gem 'stripe-rails', '0.3.1'
gem 'stripe', '1.31.0'
gem 'zapier_ruby'
gem 'algoliasearch-rails'

gem 'redcarpet', '~> 3.1.1'
gem 'rouge', '~> 1.10.1'
gem "font-awesome-rails"

gem 'carrierwave', '~> 0.10.0'
gem 'mini_magick', '~> 3.7.0'
gem 'carrierwave-aws', '~> 0.5.0'
gem 'dotenv-rails', groups: [:development, :test]
gem 'better_errors', group: :development
gem 'binding_of_caller', group: :development
gem 'pry', groups: [:development, :test]
gem 'andand'

gem 'has_permalink'

gem "letter_opener", :group => :development
gem 'seed_dump', :group => :development

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'ember-cli-rails', '~> 0.7.0'
gem 'quiet_assets', group: :development
gem 'active_model_serializers', '~> 0.9.3'

gem "rails_12factor", group: [:staging, :production]

gem 'minitest-rails'

group :test do
  gem 'minitest-rails-capybara'
  gem 'ruby-prof'
  gem 'stripe-ruby-mock', '~> 2.2.1', :require => 'stripe_mock'
  gem 'selenium-webdriver'
end

group :development do
  gem 'guard'
  gem 'guard-minitest'
end
