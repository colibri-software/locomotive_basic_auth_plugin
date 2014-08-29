
require 'locomotive/basic_auth/plugin'

# Set up mongoid
# TODO: should be a convenience method for this in locomotive_plugins
#Mongoid.configure do |config|
#  config.master = Mongo::Connection.new.db('basic_auth_test')
#end

RSpec.configure do |config|
  config.mock_framework = :mocha
end
