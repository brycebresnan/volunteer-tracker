class Volunteer
  attr_reader :id
  attr_accessor :name, :project_id

  def initialize(attributes)
    @id = attributes.fetch(:id)
    @name = attributes.fetch(:name)
    @project_id = attributes.fetch(:project_id)
  end

  def ==(volunteer_to_compare)
    self.name() == volunteer_to_compare.name()
  end

  def self.all
    results = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    results.each do |vol|
      id = vol.fetch('id').to_i
      name = vol.fetch('name')
      project_id = vol.getch('project_id').to_i
      volunteers.push(Volunteer.new({id: id, name: name, project_id: project_id}))
    end
    volunteers
  end

end