ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('rspec')
require('pry')
require('pg')
require('task')
require('list')

RSpec.configure do |config|
  config.after(:each) do
    Task.all().each() do |task|
      task.destroy()
    end
  end
end
