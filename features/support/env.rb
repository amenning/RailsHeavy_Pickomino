ENV['RAILS_ENV'] = 'test'
require './config/environment'
require 'capybara/rspec'
require 'database_cleaner'
require 'rspec/rails'

DatabaseCleaner.strategy = :truncation

Spinach.hooks.before_scenario { DatabaseCleaner.clean }

Spinach.config.save_and_open_page_on_failure = true
