require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/task')
require('./lib/list')
require('pry')
require('pg')

get('/') do
  @lists = List.all
  @tasks = Task.all
  erb(:index)
end

post('/list') do
  list = List.create(:name => params.fetch("name"))
  @lists = List.all
  erb(:index)
end

get('/list/:id') do
  @list = List.find(params.fetch("id").to_i())
  erb(:list_edit)
end

post('/tasks/:id/new') do
  @list = List.find(params.fetch("id").to_i())
  Task.create(:description => params.fetch("description"), :done => false, :list_id => @list.id)
  erb(:list_edit)
end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch("id").to_i())
  erb(:task_edit)
end

patch("/tasks/:id") do
  description = params.fetch("description")
  @list = List.find(params.fetch("list_id").to_i)
  @task = Task.find(params.fetch("id").to_i())
  @task.update({:description => description})
  @tasks = Task.all()
  erb(:list_edit)
end
