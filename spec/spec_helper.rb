ENV['RACK_ENV'] = 'test'

require('sinatra/activerecord')
require('rspec')
require('pry')
require('pg')
require('task')
require('list')



# RSpec.configure do |config|
#   config.after(:each) do
#     DB.exec('DELETE FROM stylists *;')
#     DB.exec('DELETE FROM clients *;')
#   end
# end
