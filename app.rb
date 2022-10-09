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
  if params.has_key?(:project_title)
    project = Project.find(params[:id].to_i)
    project.update({title: params[:project_title], id: nil})
  elsif params.has_key?(:volunteers)
    volunteer = Volunteer.find(params[:volunteers].to_i)
    volunteer.assign_project(params[:id].to_i)
  end
  redirect to("/projects/#{params[:id].to_i}")
end

get('/projects/:id') do
  @project = Project.find(params[:id].to_i)
  @volunteers = @project.volunteers
  @vol_all = Volunteer.all_available
  erb(:project_details)
end

get('/projects/:id/edit') do
  @project = Project.find(params[:id].to_i)
  erb(:project_edit)
end

delete('/projects/:id') do
  project = Project.find(params[:id].to_i)
  project.delete
  redirect to('/')
end

get('/volunteers') do
  @volunteers = Volunteer.all
  erb(:volunteers)
end

post('/volunteers') do
  volunteer = Volunteer.new({id: nil, name: params['vol_name'],project_id: 0})
  volunteer.save()
  redirect to('/volunteers')
end

get('/volunteers/:id') do
  @volunteer = Volunteer.find(params[:id])
  if @volunteer.project_id != 0
    @project = Project.find(@volunteer.project_id.to_i)
  else
    @project = Project.new({title: "No Project Assigned", id: 0})
  end
  @projects = Project.all
  erb(:volunteer_details)
end
  