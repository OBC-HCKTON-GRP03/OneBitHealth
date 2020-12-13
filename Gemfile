# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

gem 'rails', '~> 6.0.3', '>= 6.0.3.4'

gem 'pg', '>= 0.18', '< 2.0'

gem 'puma', '~> 4.1'

gem 'font-awesome-rails'
gem 'sass-rails', '>= 6'

gem 'jbuilder', '~> 2.7'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'cucumber-rails', '~> 2.2', require: false
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.15', '>= 2.15.1'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
  gem 'shoulda-matchers', '~> 4.4', '>= 4.4.1'
end

group :test do
  gem 'database_cleaner', '~> 1.8', '>= 1.8.5'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.5'
  gem 'email_spec', '~> 2.2'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
  gem "better_errors", "~> 2.9"
  gem "binding_of_caller", "~> 0.8.0"
  gem "annotate", "~> 3.1"
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'devise', '~> 4.7', '>= 4.7.3'

gem 'simple_form', '~> 5.0'

gem 'rubocop', require: false

gem 'rubocop-rails', '~> 2.9', require: false

gem 'rubocop-rspec', '~> 2.0', require: false

gem 'rubocop-performance', require: false

gem "carrierwave", "~> 2.1"
