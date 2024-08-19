# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |_repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'cocoon'

gem 'paper_trail'

gem 'kaminari'
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'
gem 'rails_admin', '~> 3.0'
gem 'ransack'
gem 'rubocop'
gem 'sassc-rails'

gem 'sprockets-rails'

gem 'pg', '~> 1.1'

gem 'puma'

gem 'importmap-rails'

gem 'turbo-rails'

gem 'stimulus-rails'

gem 'jbuilder'

gem 'redis', '~> 4.0'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'bootsnap', require: false

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

gem 'appdev_support'
gem 'awesome_print'
gem 'devise'
gem 'dotenv-rails'
gem 'faker'
gem 'htmlbeautifier'
gem 'http'
gem 'sqlite3', '~> 1.4'
gem 'table_print'

group :development do # rubocop:disable Bundler/DuplicatedGroup
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'draft_generators'
  gem 'grade_runner'
  gem 'pry-rails'
  gem 'rails_db'
  gem 'rails-erd'
  gem 'rufo'
  gem 'specs_to_readme'
end

group :development, :test do # rubocop:disable Bundler/DuplicatedGroup
  gem 'rspec-rails', '~> 6.0.0'
end

group :test do # rubocop:disable Bundler/DuplicatedGroup
  gem 'draft_matchers'
  gem 'rspec-html-matchers'
  gem 'webmock'
end
