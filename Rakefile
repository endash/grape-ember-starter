require 'rubygems'
require 'bundler'
require 'active_record'

include ActiveRecord::Tasks

class Seeder
  def initialize(seed_file)
    @seed_file = seed_file
  end

  def load_seed
    raise "Seed file '#{@seed_file}' does not exist" unless File.file?(@seed_file)
    load @seed_file
  end
end

DatabaseTasks.env = ENV['ENV'] || :development
DatabaseTasks.db_dir = 'db'
DatabaseTasks.migrations_paths = File.join('./db', 'migrate')
DatabaseTasks.seed_loader = Seeder.new File.join('./db', 'seeds.rb')
DatabaseTasks.database_configuration = YAML::load(File.open('./config/database.yml'))

begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts 'Run `bundle install` to install missing gems'
  exit e.status_code
end

require 'rake'

require 'rspec/core'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |spec|
  # do not run integration tests, doesn't work on TravisCI
  spec.pattern = FileList['spec/api/*_spec.rb']
end

task :environment do
  ENV['RACK_ENV'] ||= 'development'
  require File.expand_path('../config/environment', __FILE__)  
end

task routes: :environment do
  Acme::API.routes.each do |route|
    p route
  end
end

task default: [:spec]

load 'active_record/railties/databases.rake'