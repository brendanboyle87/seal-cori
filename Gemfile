source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.4'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem "foundation-rails"
gem "dotenv-rails"
gem "devise"
gem "date_validator"
gem "jquery-ui-rails", '~> 4.2.1'
gem "pdf-forms"
gem "pg_search"

group :development, :test do
  gem "capybara"
  gem "factory_girl_rails"
  gem "fuubar"
  gem "rspec-rails", "~> 3.0"
  gem "pry-rails"
  gem "shoulda-matchers"
end

group :test do
  gem "launchy", require: false
  gem "valid_attribute"
  gem 'coveralls', require: false
  gem 'database_cleaner'
  gem 'poltergeist'
end

group :production do
  gem "rails_12factor"
end

ruby "2.2.2"
