$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'app'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'rubygems'
require 'bundler/setup'
require 'active_record'

require 'grape-active_model_serializers'

Bundler.require :default, ENV['RACK_ENV']

require 'api'
require 'endpoints'
require 'models'
require 'serializers'

Endpoints.constants.map { |c| Endpoints.const_get(c) }.select { |c| c < Grape::API }.each do |c|
  API.mount c
end

class Application
  def call(env)
    API.call(env).tap do
      ActiveRecord::Base.clear_active_connections!
    end
  end
end