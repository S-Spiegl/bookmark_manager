# frozen_string_literal: true

source "https://rubygems.org"

ruby '3.0.2'

gem 'puma'
gem 'rack'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'webrick'
gem 'launchy'
gem 'pg'
gem 'rerun'

group :test do
  gem 'capybara'
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end
