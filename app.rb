require('sinatra')
require('sinatra/reloader')
require('./lib/project')
require('./lib/volunteerg')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

# Don't forget to include accurate setup instructions in your README.md!

DB = PG.connect({:dbname => "volunteer_tracker_test"})

get('/') do
  @projects = Project.all
  erb(:projects)
end
