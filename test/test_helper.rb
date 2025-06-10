ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "database_cleaner/active_record"
require "minitest/reporters"
require 'simplecov'

SimpleCov.start do
  add_group 'Models', 'test/models'
  add_group 'Controllers', 'test/controllers'
  add_group 'Services', 'test/services'
  add_group 'Helpers', 'test/helpers'
  add_group 'Jobs', 'test/jobs'
  add_group 'Mailers', 'test/mailers'
  add_group 'Policies', 'test/policies'
end
Minitest::Reporters.use!

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    DatabaseCleaner.strategy = :transaction

    setup { DatabaseCleaner.start }
    teardown { DatabaseCleaner.clean }

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    # fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
