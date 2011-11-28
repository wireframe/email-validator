require 'rubygems'
require 'bundler/setup'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'email-validator'

config = YAML::load(IO.read(File.join(File.dirname(__FILE__), 'database.yml')))
# ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__), "debug.log"))
ActiveRecord::Base.establish_connection(config[ENV['DB'] || 'sqlite'])

require 'shoulda/context'
require 'test/unit'
class Test::Unit::TestCase
end
