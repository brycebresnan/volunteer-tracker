require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteer')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

# Don't forget to include accurate setup instructions in your README.md!

DB = PG.connect({:dbname => "volunteer_tracker_test"})

get('/') do
  @projects = Project.all
  erb(:projects)
end

get('/projects') do
  redirect to('/')
end

post('/projects') do
  project = Project.new({id: nil, title: params['project_title']})
  project.save()
  redirect to('/')
end

patch('/projects/:id') do
  project = Project.find(params[:id].to_i)
  project.update({title: params[:project_title], id: nil})
  binding.pry
  redirect to('/')
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @volunteers = Volunteer.all
  erb(:project_details)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i)
  erb(:project_edit)
end
