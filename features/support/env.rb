require 'cucumber/rails'
ActionController::Base.allow_rescue = false
Cucumber::Rails::Database.javascript_strategy = :truncation

require 'cucumber/rspec/doubles'
require 'coveralls'
Coveralls.wear!('rails')

