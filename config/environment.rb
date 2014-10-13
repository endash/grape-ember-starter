ENV['RACK_ENV'] ||= 'test'

require File.expand_path('../application', __FILE__)

unless ENV['RACK_ENV'] == 'test'
  ActiveRecord::Base.configurations = YAML::load(File.open('./config/database.yml'))
  ActiveRecord::Base.establish_connection ENV['RACK_ENV']
end