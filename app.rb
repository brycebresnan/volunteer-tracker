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

post('/projects') do
  project = Project.new({id: nil, title: params['project_title']})
  project.save()
  redirect to('/')
end