require 'capybara/rspec'
require_relative '../server'
include Capybara::DSL

Capybara.app = Temperature