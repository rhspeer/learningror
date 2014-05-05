source 'https://rubygems.org'

gem 'rails', '4.1'

gem 'coffee-rails', '~> 4.0.0'
gem 'devise'
gem 'haml-rails'
gem 'jbuilder', '~> 1.2'
gem 'jquery-rails'
gem 'sass-rails', '~> 4.0.2'
gem 'transitions', require: ["transitions", "active_model/transitions"]
gem 'uglifier', '>= 1.3.0'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'spring'
  gem 'sqlite3'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
  gem 'unicorn'
end
