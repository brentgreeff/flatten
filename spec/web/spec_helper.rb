ENV["RACK_ENV"] = "test"
require_relative '../../flatten'
# raise "test database doesn't end with test" unless DB.get{current_database{}} =~ /test\z/

Flatten.freeze

require 'capybara'
require 'capybara/dsl'
require 'rack/test'

Capybara.configure do |config|
  config.app = Flatten.app
end

require_relative '../minitest_helper'
